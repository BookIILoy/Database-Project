from . import models
from django.db import connection

# analytic card

cursor = connection.cursor()

def order_received():
    cursor.execute(\
    """
    SELECT COUNT(*) AS count
    FROM `order` o, `call` c
    WHERE o.order_id = c.order_id AND c.date = '2023-05-26'
    """)
    return cursor.fetchone()[0]

def order_delivered():
    cursor.execute(\
    """
    SELECT COUNT(*) AS count
    FROM `order` o, `call` c
    WHERE o.order_id = c.order_id 
    AND c.date = '2023-05-26'
    AND o.status = 'success'
    """)
    return cursor.fetchone()[0]

def net_earning():
    cursor.execute(\
    """
    SELECT SUM(z.price) AS price
    FROM 
    (
        (
            SELECT o.order_id, SUM(o.count* m.price) AS price 
            FROM `order_detail` o, `call` c, `menu_and_package` mp, `menu` m 
            WHERE o.order_id = c.order_id 
            AND o.Menu_and_package_id = mp.Menu_and_package_id 
            AND mp.menu_id = m.menu_id
            AND c.date = '2023-05-26'
            GROUP BY o.order_id
        ) 
        UNION 
        (
            SELECT o.order_id, SUM(o.count* p.price) AS price 
            FROM `order_detail` o, `call` c, `menu_and_package` mp, `package` p 
            WHERE o.order_id = c.order_id 
            AND o.Menu_and_package_id = mp.Menu_and_package_id 
            AND mp.package_id = p.package_id
            AND c.date = '2023-05-26'
            GROUP BY o.order_id
        )
    ) 
    AS z;
    """)
    return cursor.fetchone()[0]

def issue_received():
    cursor.execute(\
    """
    SELECT COUNT(*)
    FROM `issue` i, `call` c
    WHERE i.issue_id = c.issue_id
    AND c.date = '2023-05-26'
    """)
    return cursor.fetchone()[0]

def issue_solved():
    cursor.execute(\
    """
    SELECT COUNT(*)
    FROM `issue` i, `call` c
    WHERE i.issue_id = c.issue_id
    AND c.date = '2023-05-26'
    AND i.is_handled = 1
    """)
    return cursor.fetchone()[0]

def issue_unsolved():
    cursor.execute(\
    """
    SELECT COUNT(*)
    FROM `issue` i, `call` c
    WHERE i.issue_id = c.issue_id
    AND c.date = '2023-05-26'
    AND i.is_handled = 0
    """)
    return cursor.fetchone()[0]


def staff_id(request):
    return int(request.user.username[:4])

def query_call_id(request):
    st_id = staff_id(request)
    call = models.Call.objects.raw(\
        f"""
        SELECT call_id, staff_id
        FROM `call`
        WHERE staff_id = {st_id}
        AND status = 'Oncall'
        """
    )

    if call:
        return call
    else:
        return -1
    
def average_talk_time(request):
    cursor.execute(
        """
        SELECT AVG((end_time - start_time)/100) 
        FROM `call` c 
        WHERE c.status = 'Finished';
        """
    )
    return cursor.fetchone()[0]

def average_queue_time(request):
    cursor.execute(
        """
        SELECT AVG((start_time - customer_call_time)/100) 
        FROM `call` c 
        WHERE c.status = 'Finished';

        """
    )
    return cursor.fetchone()[0]