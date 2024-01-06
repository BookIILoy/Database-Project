from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.db import connection
from django.http import HttpResponseRedirect
from django.urls import reverse
from . import models
from . import control

# Create your views here.

cursor = connection.cursor()

def dashboard(request):
    if(not request.user.is_authenticated):
        return redirect('home')
    print(request.user.username)
    order_list = models.Order.objects.raw( \
        """
        SELECT o.order_id,o.detail_address,o.order_time,o.customer_name,o.tel_no,o.status,b.branch_address, c.date
        FROM `order` o, `branch` b, `call` c
        WHERE o.branch_id = b.branch_id 
        AND o.order_id = c.order_id
        AND c.date = '2023-05-26'
        ORDER BY c.date DESC, o.order_time DESC;
        """)
    Issue_list = models.Issue.objects.raw(\
        """
        SELECT i.issue_id, i.priority, i.category, i.issue_topic, i.is_handled, s.staff_fname, s.staff_lname, c.end_time, c.date
        FROM `issue` i, `staff` s, `call` c
        WHERE i.issuer = s.staff_id 
        AND i.issue_id = c.issue_id
        AND c.date = '2023-05-26'
        ORDER BY i.priority ASC, c.date DESC,c.end_time DESC
        """)
    return render(request, 'dashboard.html', {\
                                                'order_list' : order_list,\
                                                'issue_list': Issue_list,\
                                                'order_received':control.order_received(),\
                                                'order_delivered' : control.order_delivered(),\
                                                'net_earning' : control.net_earning(), \
                                                'issue_received' : control.issue_received(), \
                                                'issue_unsolved' : control.issue_unsolved(), \
                                                'issue_solved' : control.issue_solved()
                                            })

def home(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    else:
        if request.method == 'POST':
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(request, username = username, password = password)
            if user is not None:
                login(request, user)
                return redirect('dashboard')
            else:
                messages.success(request, "Username or Password is incorrect. Please try again.")
                return redirect('home')
        return render(request, 'login.html', {})

def user_logout(request):
    logout(request)
    return redirect('home')

def order_page(request):
    if(not request.user.is_authenticated):
        return redirect('home')
    if(request.method == 'POST'):
        column = request.POST['order_column']
        keyword = request.POST['keyword']
        if keyword == '':
            return redirect('order')
        return HttpResponseRedirect(reverse('order_search', args=(column, keyword)))
    order_list = models.Order.objects.raw( \
        """
        SELECT o.order_id,o.detail_address,o.order_time,o.customer_name,o.tel_no,o.status,b.branch_address, c.date
        FROM `order` o, `branch` b, `call` c
        WHERE o.branch_id = b.branch_id 
        AND o.order_id = c.order_id
        ORDER BY c.date DESC, o.order_time DESC;
        """)
    return render(request, 'order.html',{'order_list' : order_list})

def order_page_search(request, order_column, keyword):
    if(not request.user.is_authenticated):
        return redirect('home')

    
    if order_column == 'ID':
        try:
            int(keyword)
        except:
            return redirect('order')
        
        order_list = models.Order.objects.raw(\
            """
            SELECT o.order_id,o.detail_address,o.order_time,o.customer_name,o.tel_no,o.status,b.branch_address, c.date
            FROM `order` o, `branch` b, `call` c
            WHERE o.branch_id = b.branch_id 
            AND o.order_id = c.order_id
            AND o.order_id = {}
            ORDER BY c.date DESC, o.order_time DESC;
            """.format(keyword)
        )
        return render(request, 'order.html', {'order_list' : order_list})
    elif order_column == 'status':
        if keyword not in ('cancel', 'pending', 'delivering', 'success'):
            return redirect('order')
        order_list = models.Order.objects.raw(\
            """
            SELECT o.order_id,o.detail_address,o.order_time,o.customer_name,o.tel_no,o.status,b.branch_address, c.date
            FROM `order` o, `branch` b, `call` c
            WHERE o.branch_id = b.branch_id 
            AND o.order_id = c.order_id
            AND o.status = '{}'
            ORDER BY c.date DESC, o.order_time DESC;
            """.format(keyword)
        )
        return render(request, 'order.html', {'order_list' : order_list})
    else:
        order_list = models.Order.objects.raw(\
            f"""
            SELECT o.order_id,o.detail_address,o.order_time,o.customer_name,o.tel_no,o.status,b.branch_address, c.date
            FROM `order` o, `branch` b, `call` c
            WHERE o.branch_id = b.branch_id 
            AND o.order_id = c.order_id
            AND o.{order_column} LIKE '%%{keyword}%%'
            ORDER BY c.date DESC, o.order_time DESC;
            """
        ) 

        return render(request, 'order.html', {'order_list' : order_list})
    
def issue_page(request):
    if not request.user.is_authenticated:
        return redirect('home')
    
    if request.method == 'POST':
        if request.POST['keyword'] == '':
            return redirect('issue')
        return HttpResponseRedirect(reverse('issue_search', args=(request.POST['issue_column'], request.POST['keyword'])))

    Issue_list = models.Issue.objects.raw(\
        """
        SELECT i.issue_id, i.priority, i.category, i.issue_topic, i.is_handled, s.staff_fname, s.staff_lname, c.end_time, c.date, i.issuer
        FROM `issue` i, `staff` s, `call` c
        WHERE i.issuer = s.staff_id 
        AND i.issue_id = c.issue_id
        ORDER BY i.priority ASC, c.date DESC,c.end_time DESC
        """)
    return render(request, 'issue.html', {'issues': Issue_list})

def issue_page_search(request, issue_column, keyword):
    if not request.user.is_authenticated:
        return redirect('home')

    if keyword == '':
        return redirect('home')

    if issue_column == 'priority':
        print('yes')
        if keyword not in ('Normal', 'Important', 'Urgent'):
            try:
                int_test = int(keyword)
                if int_test > 3 or int_test < 1:
                    raise Exception('Sorry')
            except:
                return redirect('issue')
            Issue_list = models.Issue.objects.raw(\
                f"""
                SELECT i.issue_id, i.priority, i.category, i.issue_topic, i.is_handled, s.staff_fname, s.staff_lname, c.end_time, c.date, i.issuer
                FROM `issue` i, `staff` s, `call` c
                WHERE i.issuer = s.staff_id 
                AND i.issue_id = c.issue_id
                AND i.priority = {keyword}
                ORDER BY i.priority ASC, c.date DESC,c.end_time DESC
                """)       
            return render(request, 'issue.html', {'issues': Issue_list})
        else:
            priority = '1'
            if keyword == 'Normal':
                priority = '1'
            elif keyword == 'Important':
                priority = '2'
            else:
                priority = '3'
            Issue_list = models.Issue.objects.raw(\
                f"""
                SELECT i.issue_id, i.priority, i.category, i.issue_topic, i.is_handled, s.staff_fname, s.staff_lname, c.end_time, c.date, i.issuer
                FROM `issue` i, `staff` s, `call` c
                WHERE i.issuer = s.staff_id 
                AND i.issue_id = c.issue_id
                AND i.priority = {priority}
                ORDER BY i.priority ASC, c.date DESC,c.end_time DESC
                """)       
            return render(request, 'issue.html', {'issues': Issue_list})
    elif issue_column == 'issuer' or issue_column == 'issue_id' :
        try:
            int_test = int(keyword)
        except:
            return redirect('issue')
        Issue_list = models.Issue.objects.raw(\
                f"""
                SELECT i.issue_id, i.priority, i.category, i.issue_topic, i.is_handled, s.staff_fname, s.staff_lname, c.end_time, c.date, i.issuer
                FROM `issue` i, `staff` s, `call` c
                WHERE i.issuer = s.staff_id 
                AND i.issue_id = c.issue_id
                AND i.{issue_column} = {keyword}
                ORDER BY i.priority ASC, c.date DESC,c.end_time DESC
                """)
        return render(request, 'issue.html', {'issues': Issue_list})
    elif issue_column == 'is_handled':
        if keyword not in('Solved', 'Unsolved'):
            try:
                int_test = int(keyword)
                if(int_test != 0 or int_test != 1):
                    raise Exception('Sorry')
            except:
                return redirect('issue')
            Issue_list = models.Issue.objects.raw(\
                f"""
                SELECT i.issue_id, i.priority, i.category, i.issue_topic, i.is_handled, s.staff_fname, s.staff_lname, c.end_time, c.date, i.issuer
                FROM `issue` i, `staff` s, `call` c
                WHERE i.issuer = s.staff_id 
                AND i.issue_id = c.issue_id
                AND i.is_handled = {keyword}
                ORDER BY i.priority ASC, c.date DESC,c.end_time DESC
                """)
            return render(request, 'issue.html', {'issues': Issue_list})
        else:
            is_handled = '1'
            if keyword == 'Unsolved':
                is_handled ='0'
            Issue_list = models.Issue.objects.raw(\
                f"""
                SELECT i.issue_id, i.priority, i.category, i.issue_topic, i.is_handled, s.staff_fname, s.staff_lname, c.end_time, c.date, i.issuer
                FROM `issue` i, `staff` s, `call` c
                WHERE i.issuer = s.staff_id 
                AND i.issue_id = c.issue_id
                AND i.is_handled = {is_handled}
                ORDER BY i.priority ASC, c.date DESC,c.end_time DESC
                """)
            return render(request, 'issue.html', {'issues': Issue_list})
    else:
        Issue_list = models.Issue.objects.raw(\
                f"""
                SELECT i.issue_id, i.priority, i.category, i.issue_topic, i.is_handled, s.staff_fname, s.staff_lname, c.end_time, c.date, i.issuer
                FROM `issue` i, `staff` s, `call` c
                WHERE i.issuer = s.staff_id 
                AND i.issue_id = c.issue_id
                AND {issue_column[0]}.{issue_column} LIKE '%%{keyword}%%'
                ORDER BY i.priority ASC, c.date DESC,c.end_time DESC
                """)
        return render(request, 'issue.html', {'issues': Issue_list})

def membership(request):
    if not request.user.is_authenticated:
        return redirect('home')

    if request.method == 'POST':
        if request.POST['keyword'] == '':
            return redirect('membership')
        return HttpResponseRedirect(reverse('membership_search', args=(request.POST['member_column'], request.POST['keyword'])))

    member_list = models.Member.objects.raw(\
        """
        SELECT *
        FROM `member`
        """
        )
    return render(request, 'membership.html', {'members' : member_list})

def membership_search(request, member_column, keyword):
    if not request.user.is_authenticated:
        return redirect('home')

    if member_column == 'member_id' or member_column == 'member_point_available':
        try:
            int(keyword)
        except:
            return redirect('membership')
        member_list = models.Member.objects.raw(\
        f"""
            SELECT *
            FROM `member`
            WHERE {member_column} = {keyword}
        """)
        return render(request, 'membership.html', {'members' : member_list})
    else:
        member_list = models.Member.objects.raw(\
            f"""
            SELECT *
            FROM `member`
            WHERE {member_column} LIKE '%%{keyword}%%'
            """)
        return render(request, 'membership.html', {'members' : member_list})

def order_record(request, pk):
    if not request.user.is_authenticated:
        return redirect('home')
    customer_d = models.Order.objects.raw(
        f"""
        SELECT o.order_id, o.customer_name, o.detail_address, o.tel_no, o.side_note
        FROM `order` o
        WHERE o.order_id = {pk}
        """
    )
    membership_d = models.Order.objects.raw(\
        f"""
        SELECT o.order_id, m.member_fname, m.member_mname, m.member_lname, m.member_id, o.member_point_gain_or_used 
        FROM `member` m, `order` o 
        WHERE o.member_id = m.member_id 
        AND o.order_id = {pk};
        """
    )
    package_list = models.OrderDetail.objects.raw(\
        f"""
        SELECT od.order_id, p.package_name, od.count 
        FROM `order_detail` od, `menu_and_package` mp, `package` p 
        WHERE od.Menu_and_package_id = mp.Menu_and_package_id 
        AND mp.package_id = p.package_id
        AND od.order_id = {pk};
        """
        )
    menu_list = models.OrderDetail.objects.raw(\
        f"""
        SELECT od.order_id, m.menu_name, od.count 
        FROM `order_detail` od, `menu_and_package` mp, `menu` m 
        WHERE od.Menu_and_package_id = mp.Menu_and_package_id 
        AND mp.menu_id = m.menu_id
        AND od.order_id = {pk};
        """
        )
    return render(request, 'orderview.html', {'c_ds' : customer_d,'m_ds' : membership_d,'packages' : package_list, 'menu_l' : menu_list})

def issue_record(request, pk):
    if not request.user.is_authenticated:
        return redirect('home')
    if request.method == 'POST':
        solution = request.POST['issue_solution']
        cursor.execute(\
            f""" 
            UPDATE `issue`
            SET solution = '{solution}', is_handled = 1
            WHERE issue_id = {pk}    
            """
            )
    issue_l = models.Issue.objects.raw(\
        f"""
        SELECT issue_id, issue_topic, category, priority, detail, solution, is_handled
        FROM `issue`
        WHERE issue_id = {pk}
        """
    )
    return render(request, 'issueview.html', {'issue_l' : issue_l}) 

def membership_record(request, pk):
    if not request.user.is_authenticated:
        return redirect('home')
    membership_l = models.Member.objects.raw(\
        f"""
        SELECT member_id, member_fname, 
        member_mname, member_lname, address, 
        contact_tel_no, contact_email, member_point_available,
        city, province, zipcode, country
        FROM `member` 
        WHERE member_id = {pk};
        """
        )
    return render(request, 'membershipview.html', {'membership_l' : membership_l})

def incoming_call(request):
    if not request.user.is_authenticated:
        return redirect('home')
    call_list = models.Call.objects.raw(\
        """
        SELECT c.call_id, c.customer_call_time, c.status, c.tel_no 
        FROM `call` c 
        WHERE c.status = "Inqueue" 
        ORDER BY c.customer_call_time ASC;
        """
        )
    print(control.staff_id(request))
    return render(request, 'call.html', {'calls' : call_list})

def receive_call(request, call_pk):
    if not request.user.is_authenticated:
        return redirect('home')
    staff_id = str(control.staff_id(request))
    check_if_staff_oncall = models.Call.objects.raw(
        f"""
        SELECT call_id, staff_id
        FROM `call`
        WHERE staff_id = {staff_id}
        AND status = 'Oncall'
        """
    )
    check_if_oncall = models.Call.objects.raw(
        f"""
        SELECT call_id, staff_id
        FROM `call`
        WHERE call_id = {call_pk}
        AND status = 'Oncall'
        """
    )
    if check_if_oncall or check_if_staff_oncall:
        return render(request, 'blank.html')
    cursor.execute(\
        f"""
        UPDATE `call`
        SET status = 'Oncall', start_time = CURRENT_TIME(), staff_id = {staff_id}
        WHERE call_id = {call_pk};
        """
    )
    call_list = models.Call.objects.raw(\
        f"""
        SELECT c.call_id, c.customer_call_time, c.status, c.tel_no 
        FROM `call` c 
        WHERE c.call_id = {call_pk} 
        """
        )
    return render(request, 'calling.html', {'calls' : call_list})

def hang_up(request, pk):
    cursor.execute(\
        f"""
        UPDATE `call`
        SET status = 'Finished', end_time = CURRENT_TIME
        WHERE call_id = {pk};
        """
        )
    return render(request, 'blank.html', {})

def add_order(request):
    if not request.user.is_authenticated:
        return redirect('home')
    
    call_id = control.query_call_id(request)
    if(call_id == -1):
        return redirect('order')
    else:
        return HttpResponseRedirect(reverse('add_order_page', args=(call_id)))
    
def add_order_page(request, call_pk):
    if not request.user.is_authenticated:
        return redirect('home')
    call_id = ''.join(x for x in call_pk if x.isdigit())
    menu_list = models.MenuAndPackage.objects.raw(
        """
        SELECT mp.Menu_and_package_id, m.menu_name 
        FROM `menu` m, `menu_and_package` mp 
        WHERE mp.menu_id = m.menu_id;
        """
    )
    package_list = models.MenuAndPackage.objects.raw(
        """
        SELECT mp.Menu_and_package_id, p.package_name
        FROM `package` p, `menu_and_package` mp 
        WHERE mp.package_id = p.package_id;
        """
    )
    branch_list = models.Branch.objects.raw(
        """
        SELECT b.branch_id, b.branch_address
        FROM `branch` b
        """
    )
    if request.method == 'POST':
        branch_id = request.POST['Branch']
        customer_name = request.POST['customer_name']
        address = request.POST['customer_address']
        tel_no = request.POST['tel_no']
        is_member = request.POST['is_member']
        mem_id = request.POST['mem_id']
        note = request.POST['note']
        promotion = request.POST['promotion']
        if is_member == '1':
            try:
                int(mem_id)
            except:
                return redirect('order')
            cursor.execute(
                f"""
                INSERT INTO `order` 
                ( `customer_name`, `tel_no`, `status`, `order_time`, `date`, `member_point_gain_or_used`, `side_note`, `detail_address`, `member_id`, `branch_id`, `promotion_id`) 
                VALUES ('{customer_name}', '{tel_no}', 'pending', CURRENT_TIME(), CURRENT_DATE, -{promotion}, '{note}', '{address}', {mem_id}, {branch_id}, {promotion}/100);
                """
            )
        else:
            cursor.execute(
                f"""
                INSERT INTO `order` ( `customer_name`, `tel_no`, `status`, `order_time`, `date`, `side_note`, `detail_address`, `branch_id`) 
                VALUES ('{customer_name}', '{tel_no}', 'pending', CURRENT_TIME(), CURRENT_DATE, '{note}', '{address}', {branch_id}); 
                """
            )
        order_list = models.Order.objects.raw(
            f"""
            SELECT order_id
            FROM `order`
            """
        )
        order_id = order_list[-1].order_id
        for package in package_list:
            output = request.POST[str(package.menu_and_package_id)]        
            if(output != "0"):
                cursor.execute(f"""
                INSERT INTO `order_detail` (`order_id`, `menu_and_package_id`, `count`)
                VALUES ({order_id}, {package.menu_and_package_id}, {output})
                """)
        for menu in menu_list:
            output = request.POST[str(menu.menu_and_package_id)]
            if(output != "0"):
                cursor.execute(f""" 
                INSERT INTO `order_detail` (`order_id`, `menu_and_package_id`, `count`)
                VALUES ({order_id}, {menu.menu_and_package_id}, {output});
                """)
        cursor.execute(
            f""" UPDATE `call`
            SET order_id = {order_id}
            WHERE call_id = {call_id};
            """
        )
        return redirect('order')
    return render(request, 'addOrder.html', {'menu_list':menu_list, 'package_list' : package_list, 'call_pk': call_pk, 'branch_list':branch_list})

def add_issue(request):
    if not request.user.is_authenticated:
        return redirect('home')
    
    call_id = control.query_call_id(request)
    if(call_id == -1):
        return redirect('issue')
    else:
        return HttpResponseRedirect(reverse('add_issue_page', args=(call_id)))

def add_issue_page(request, call_pk):
    if not request.user.is_authenticated:
        return redirect('home')
    call_id = ''.join(x for x in call_pk if x.isdigit())
    staff_id = control.staff_id(request)
    if(request.method == 'POST'):
        topic = request.POST['topic']
        category = request.POST['category']
        priority = request.POST['priority']
        issue_detail = request.POST['issue_detail']
        is_handled = request.POST['is_handled']
        issue_solution = request.POST['issue_solution']
        cursor.execute(
            f"""
            INSERT INTO `issue` (issue_topic, detail, is_handled, solution, priority, category, issuer)
            VALUES ('{topic}', '{issue_detail}', {is_handled}, '{issue_solution}', {priority}, '{category}', {staff_id})
            """
        )
        issue_id_list = models.Issue.objects.raw(
            """
            SELECT issue_id
            FROM `issue`
            """
        )
        issue_id = issue_id_list[-1].issue_id
        cursor.execute(
            f""" UPDATE `call`
            SET issue_id = {issue_id}
            WHERE call_id = {call_id};
            """
        )
        return redirect('issue')
    return render(request, 'addissue.html', {'call_pk' : call_pk})

def add_member(request):
    if not request.user.is_authenticated:
        return redirect('home')
    
    call_id = control.query_call_id(request)
    if(call_id == -1):
        return redirect('membership')
    else:
        return HttpResponseRedirect(reverse('add_member_page', args=(call_id)))

def add_member_page(request, call_pk):
    if not request.user.is_authenticated:
        return redirect('home')
    call_id = ''.join(x for x in call_pk if x.isdigit())

    if request.method == 'POST':
        fname = request.POST['customer_fname']
        mname = request.POST['customer_mname']
        lname = request.POST['customer_lname']
        dob = request.POST['dob']
        address = request.POST['address']
        province = request.POST['province']
        city = request.POST['city']
        zipcode = request.POST['zipcode']
        country = request.POST['country']
        tel_no = request.POST['tel_no']
        email = request.POST['email']
        cursor.execute(
            f"""
            INSERT INTO `member` (`member_fname`, `member_mname`, `member_lname`, `contact_tel_no`, `contact_email`, `member_point_used`, `member_point_available`, `dob`, `register_date`, `expire_date`, `address`, `city`, `province`, `zipcode`, `country`) 
            VALUES ('{fname}', '{mname}', '{lname}', '{tel_no}', '{email}', '0', '0', '{dob}', CURRENT_DATE, CURRENT_DATE + INTERVAL 5 YEAR, '{address}', '{city}', '{province}', '{zipcode}', '{country}');
            """
        )
        member_list = models.Member.objects.raw(
            f"""
            SELECT member_id
            FROM `member`
            """
        )
        member_id = member_list[-1].member_id
        cursor.execute(
            f""" UPDATE `call`
            SET member_register_id = {member_id}
            WHERE call_id = {call_id};
            """
        )
        return redirect('membership')
    return render(request, 'addMembership.html', {'call_pk' : call_pk})

def report(request):
    if not request.user.is_authenticated:
        return redirect('home')
    top3menu = models.MenuAndPackage.objects.raw(
        """
        SELECT h.Menu_and_package_id, COALESCE(h.menu_name, h.package_name) as Name 
        FROM ( SELECT g.Menu_and_package_id, g.menu_name, p.package_name, g.count 
        FROM ( SELECT b.Menu_and_package_id, b.package_id, b.count, m.menu_name 
        FROM ( SELECT a.Menu_and_package_id, a.count, mp.package_id, mp.menu_id 
        FROM ( SELECT z.Menu_and_package_id, z.count 
        FROM ( SELECT Menu_and_package_id, SUM(count) as count 
        FROM `order_detail` GROUP BY Menu_and_package_id) as z ORDER BY z.count DESC LIMIT 3) as a 
        LEFT JOIN `menu_and_package` mp ON a.Menu_and_package_id = mp.Menu_and_package_id) as b 
        LEFT JOIN `menu` m ON b.menu_id = m.menu_id) as g 
        LEFT JOIN `package` p ON g.package_id = p.package_id) as h;
        """
    )
    number_of_call = models.Call.objects.raw(
        """
        SELECT c.call_id, MIN(c.customer_call_time) as MinTime, MAX(c.customer_call_time) as MaxTime, COUNT(*) as count 
        FROM `call` c 
        GROUP BY HOUR(c.customer_call_time);
        """
    )
    call_history = models.Call.objects.raw(
        """
        SELECT a.call_id, a.MinDate as date, COALESCE(a.count, 0) as accept, COALESCE(b.count,0) as abandon 
        FROM ( SELECT c.call_id, MIN(c.date) as MinDate, COUNT(*) as count 
        FROM `call` c WHERE c.status = 'Finished' GROUP BY DATE(c.date)) as a 
        LEFT JOIN ( SELECT c.call_id, MIN(c.date) as MinDate, MAX(c.date) as MaxDate, COUNT(*) as count 
        FROM `call` c WHERE c.status = 'Abandon_Inqueue' GROUP BY DATE(c.date)) as b 
        ON a.MinDate = b.MinDate;
        """
    )
    daily_abandon_call = models.Call.objects.raw(
        """
        SELECT c.call_id, MIN(c.customer_call_time) as MinTime, MAX(c.customer_call_time) as MaxTime, COUNT(*) as count 
        FROM `call` c 
        WHERE c.status = 'Abandon_Inqueue' 
        AND c.date = '2023-05-25' 
        GROUP BY HOUR(c.customer_call_time);
        """
    )
    return render(request, 'report.html', {\
        'top1' : top3menu[0].Name,\
        'top2' : top3menu[1].Name,\
        'top3' : top3menu[2].Name, \
        'avg_t':control.average_talk_time(request),\
        'avg_q':control.average_queue_time(request),\
        'num_call' : number_of_call,\
        'call_hist' : call_history,\
        'abandon_calls' : daily_abandon_call})