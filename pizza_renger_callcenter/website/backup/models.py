# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'
        app_label = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        app_label = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        app_label = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'
        app_label = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        app_label = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        app_label = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Branch(models.Model):
    branch_id = models.AutoField(primary_key=True)
    branch_address = models.TextField()
    branch_contact_tel_no = models.CharField(max_length=10)
    branch_contact_manager_tel_no = models.CharField(max_length=10)
    manager_staff = models.ForeignKey('Staff', models.DO_NOTHING, db_column='Manager_staff_ID')  # Field name made lowercase.
    branch_contact_email = models.CharField(max_length=64)
    city = models.CharField(max_length=64)
    province = models.CharField(max_length=64)
    zipcode = models.CharField(max_length=5)
    country = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'branch'
        app_label = 'branch'


class Call(models.Model):
    call_id = models.AutoField(primary_key=True)
    order = models.ForeignKey('Order', models.DO_NOTHING, blank=True, null=True)
    status = models.CharField(max_length=15)
    category = models.CharField(max_length=5)
    customer_call_time = models.DateTimeField()
    date = models.DateField()
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    staff = models.ForeignKey('Staff', models.DO_NOTHING)
    issue = models.ForeignKey('Issue', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'call'
        app_label = 'call'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'
        app_label = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        app_label = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'
        app_label = 'django_content_type'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
        app_label = 'django_session'


class Issue(models.Model):
    issue_id = models.AutoField(primary_key=True)
    issue_topic = models.CharField(max_length=256)
    detail = models.TextField()
    is_handled = models.IntegerField()
    solution = models.TextField(blank=True, null=True)
    priority = models.IntegerField()
    category = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'issue'
        app_label = 'issue'


class Member(models.Model):
    member_id = models.AutoField(primary_key=True)
    member_fname = models.CharField(max_length=64)
    member_mname = models.CharField(max_length=64, blank=True, null=True)
    member_lname = models.CharField(max_length=64)
    contact_tel_no = models.CharField(max_length=10)
    contact_email = models.CharField(max_length=64)
    member_point_used = models.IntegerField()
    member_point_available = models.IntegerField()
    dob = models.DateField()
    register_date = models.DateField()
    expire_date = models.DateField()
    address = models.TextField()
    city = models.CharField(max_length=64)
    province = models.CharField(max_length=64)
    zipcode = models.CharField(max_length=5)
    country = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'member'
        app_label = 'member'


class Menu(models.Model):
    menu_id = models.AutoField(primary_key=True)
    menu_name = models.CharField(max_length=64)
    description = models.CharField(max_length=128)
    price = models.IntegerField()
    is_available = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'menu'
        app_label = 'menu'


class MenuAndPackage(models.Model):
    menu_and_package_id = models.AutoField(db_column='Menu_and_package_id', primary_key=True)  # Field name made lowercase.
    package = models.ForeignKey('Package', models.DO_NOTHING, blank=True, null=True)
    menu = models.ForeignKey(Menu, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'menu_and_package'
        app_label = 'menu_and_package'


class MonthlyUsedPromotion(models.Model):
    promotion = models.OneToOneField('Promotion', models.DO_NOTHING, db_column='promotion_ID', primary_key=True)  # Field name made lowercase. The composite primary key (promotion_ID, member_ID) found, that is not supported. The first column is selected.
    member = models.ForeignKey(Member, models.DO_NOTHING, db_column='member_ID')  # Field name made lowercase.
    count = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'monthly_used_promotion'
        app_label = 'monthly_used_promotion'
        unique_together = (('promotion', 'member'),)


class Order(models.Model):
    order_id = models.AutoField(primary_key=True)
    customer_name = models.CharField(max_length=128)
    tel_no = models.CharField(max_length=10)
    status = models.CharField(max_length=10)
    estimate_time = models.DateTimeField()
    arriving_time = models.DateTimeField()
    date = models.DateField()
    time = models.DateTimeField()
    member_point_gain_or_used = models.IntegerField(blank=True, null=True)
    total_price = models.IntegerField()
    side_note = models.TextField(blank=True, null=True)
    detail_address = models.TextField()
    member = models.ForeignKey(Member, models.DO_NOTHING, blank=True, null=True)
    branch = models.ForeignKey(Branch, models.DO_NOTHING, blank=True, null=True)
    promotion = models.ForeignKey('Promotion', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        db_table = 'order'
        app_label = 'order'


class OrderDetail(models.Model):
    order = models.OneToOneField(Order, models.DO_NOTHING, primary_key=True)  # The composite primary key (order_id, Menu_and_package_id) found, that is not supported. The first column is selected.
    menu_and_package = models.ForeignKey(MenuAndPackage, models.DO_NOTHING, db_column='Menu_and_package_id')  # Field name made lowercase.
    count = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'order_detail'
        app_label = 'order_detail'
        unique_together = (('order', 'menu_and_package'),)


class Package(models.Model):
    package_id = models.AutoField(primary_key=True)
    package_name = models.CharField(max_length=64)
    description = models.CharField(max_length=128)
    price = models.IntegerField()
    is_available = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'package'
        app_label = 'package'


class PackageDetail(models.Model):
    package = models.OneToOneField(Package, models.DO_NOTHING, primary_key=True)  # The composite primary key (package_id, menu_id) found, that is not supported. The first column is selected.
    menu = models.ForeignKey(Menu, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'package_detail'
        app_label = 'package_detail'
        unique_together = (('package', 'menu'),)


class Promotion(models.Model):
    promotion_id = models.AutoField(primary_key=True)
    promotion_name = models.CharField(max_length=64)
    member_point_need = models.IntegerField()
    promotion_detail = models.TextField()

    class Meta:
        db_table = 'promotion'
        app_label = 'promotion'


class Shift(models.Model):
    staff = models.OneToOneField('Staff', models.DO_NOTHING, primary_key=True)  # The composite primary key (staff_id, shift, branch_id, date) found, that is not supported. The first column is selected.
    branch = models.ForeignKey(Branch, models.DO_NOTHING)
    shift = models.CharField(max_length=9)
    date = models.DateField()
    check_in_shift_time = models.DateTimeField()
    check_out_shift_time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'shift'
        app_label = 'shift'
        unique_together = (('staff', 'shift', 'branch', 'date'),)


class Staff(models.Model):
    staff_id = models.AutoField(primary_key=True)
    staff_fname = models.CharField(max_length=64)
    staff_mname = models.CharField(max_length=64, blank=True, null=True)
    staff_lname = models.CharField(max_length=64)
    bio_gender = models.CharField(max_length=6)
    religious = models.CharField(max_length=32, blank=True, null=True)
    dob = models.DateTimeField()
    contact_tel_no = models.CharField(max_length=10)
    contact_email = models.CharField(max_length=64, blank=True, null=True)
    salary = models.IntegerField()
    role = models.CharField(max_length=255)
    status = models.CharField(max_length=11)
    branch = models.ForeignKey(Branch, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'staff'
        app_label = 'staff'
