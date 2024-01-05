
class Endpoints {
  Endpoints._();

  /// Auth
  static String IAM = 'iam';
  static String LOGIN = 'iam/authentication';
  static String REGISTER = 'iam/tenants/register-request';
  static String REFRESH_TOKEN = 'iam/authentication/refresh';
  static String USER_PROFILE = 'iam/users/current';
  static String UPDATE_USER_PROFILE = 'user';
  static String UPLOAD_PHOTO = 'storage/upload';
  static String PASSWORD = 'iam/authentication/password';
  static String FORGOT_PASSWORD = '$PASSWORD/forgot';
  static String RESET_PASSWORD = '$PASSWORD/reset';
  static String CHECK_TOKEN_FORGOT_PASSWORD = '$PASSWORD/check-token';
  static String CHANGE_PASSWORD = '$PASSWORD/change';
  static String CHECK_PASSWORD = '$PASSWORD/check';
  static String IAM_PROJECT = '$IAM/tenants/current/projects';
  static String IAM_TENANT = '$IAM/tenants/current';
  static String IAM_USERS = '$IAM/users';
  static String IAM_USER_LICENSES = '$IAM/user-licenses';

  //
  static String SUBSCRIPTION_ROOT = 'subscription';
  static String SUBSCRIPTION = '$SUBSCRIPTION_ROOT/subscriptions';
  static String REQUEST_LICENSES = '$USERS/request-licenses';
  static String CURRENT_SUBSCRIPTION = '$SUBSCRIPTION/current';

  ///HUB
  static String HUB = 'hub';

  ///Email CTA
  static String EMAIL_CTA = '$HUB/email-tokens';
  static String REQUEST_LICENCES_CTA = '$IAM/email-actions/request-licenses';
  static String ACCEPT_REQUEST_LICENCE_CTA =
      '$IAM/email-actions/request-license';
  static String EMAIL_ACTION = '$IAM/email-actions';

  /// Lookup
  static String PRIORITY = 'work/settings/priorities';
  static String PROJECT_ORDER_SETTINGS =
      'iam/users/preferences/work/projects/order-settings';
  static String LOOKUP_TENANT_USERS = 'iam/tenants/users/lookup';
  static String ALL_TENANT_USERS = 'iam/tenants/users';

  ///
  /// Notification
  static String NOTIFICATION = 'hub/notifications';
  static String NOTIFICATION_UNSEEN_TOTAL = '$NOTIFICATION/unseen-total';
  static String DEVICE_TOKEN = 'hub/webhooks/devices/mobile/tokens';

  static String UNREAD_COUNT_TENANTS = "$NOTIFICATION/unread-counts";

  /// Notification Setting
  static String IAM_NOTIFICATION = 'iam/notifications';
  static String NOTIFICATION_SETTING = '$IAM_NOTIFICATION/settings-by-channel';

  ///
  /// Conversation
  static String CONVERSATIONS = 'hub/conversations';
  static String MESSENGER_TEXT = 'hub/messenger/send-text';
  static String MESSENGER_IMAGE = 'hub/messenger/send-image';
  static String MESSENGER_FILE = 'hub/messenger/send-file';
  static String ZALO_TEXT = 'hub/zalo/send-text-message';
  static String ZALO_IMAGE = 'hub/zalo/send-image-message';
  static String ZALO_FILE = 'hub/zalo/send-attach-message';
  static String HUB_EMAILS = 'hub/emails';
  static String HUB_FILE = 'hub/file/url';

  ///
  /// Sales
  static String SALES = 'sales';
  static String SALES_CONTACT = '$SALES/contacts';
  static String CHANNEL_EXISTED = '$SALES/channels/channel-existed';
  static String COMPANY_NAME_EXISTED = '$SALES/companies/exist-company-name';
  static String COMPANY_TAX_EXISTED = '$SALES/companies/exist-company-tax';
  static String SALES_PROCESS = '$SALES/processes';
  static String PROVINCES = '$SALES/locations/provinces';
  static String DISTRICTS = '$SALES/locations/districts';
  static String WARDS = '$SALES/locations/wards';
  static String COMPANY = '$SALES/companies';
  static String DOCUMENT_NO_GENERATE = '$SALES/documents/generate-document-no';
  static String DOCUMENT_NO = '$SALES/documents/search-documents';
  static String SALES_CONTACT_GET_INFO = '$SALES/contacts/get-info';
  static String PRODUCT = '$SALES/products';
  static String OPPORTUNITY = '$SALES/leads';
  static String FILE = '$SALES/file/url';
  static String CATEGORIES_LOOKUP = '$SALES/categories/lookup';
  static String TRADEMARKS_LOOKUP = '$SALES/trademarks/lookup';
  static String PRODUCT_UNITS = '$PRODUCT/product-units';

  static String USER_SESSION = "$SALES/users/me/sessions";

  ///
  /// Work
  static String LABEL = 'sales/labels';
  static String ALL_PERSON_IN_CHARGES = 'iam/users/all';
  static String SEARCH_PERSON_IN_CHARGES = 'iam/users/search';
  static String PROJECT = 'work/projects';
  static String PROJECTS_ASSIGNED = '$PROJECT/projects-assigned';
  static String PROJECT_BY_USER = 'work/projects/projects-by-user';
  static String RECENT_PROJECT = 'work/projects/recent-projects';
  static String CONTACT = 'inventory/general/partners/search';
  static String QUOTE_PRODUCT = 'sales/quotations';
  static String TASKS_BY_STAGE = 'work/projects/tasks/state-count';
  static String PROJECT_INFORMATION = 'work/projects';
  static String ADD_NEW_PROJECT = 'work/projects/new';
  static String FORMS = 'work/forms';
  static String PROJECT_INVITATION_INBOX =
      '$IAM/tenants/current/projects/invitation/notification';

  //
  static String CUSTOM_FORM = 'work/forms';
  static String WORK_CRM_PROJECT = '$WORK/crm/projects';
  static String WORK_CRM_TOPIC = '$WORK/crm/topics';

  ///
  /// Task
  static String PROJECT_LABEL = 'work/projects';
  static String MY_TASK = 'work/tasks/my-tasks';

  // static String APPROVE_TASK =
  //     'work/tasks/project-members-by-task';

  /// Reminder
  static String REMINDER = 'hub/reminders';
  static String SEARCH_REMINDER_CALENDAR = 'hub/reminders/calendars/search';

  /// Event
  static String EVENT = 'hub/events';

  ///
  /// To-do
  ///
  static String WORK = 'work';
  static String WORK_MOBILE = '$WORK/mobile';
  static String REQUEST_FORMS = "$WORK/request-forms";
  static String REQUEST_FORM_SETTING = "$REQUEST_FORMS/settings";

  static String PROJECT_FEATURES_ROLES = '$WORK/projects/features-roles';
  static String PROJECT_BY_BUSINESS = '$WORK/projects/lookup/business-form';
  static String WORK_FILE = '$WORK/file';
  static String TASK = 'work/tasks';
  static String PROJECT_STORAGE = '$WORK/project-storages';
  static String PROJECT_STORAGE_ALLOW_UPLOAD = '$PROJECT_STORAGE/allow-upload';
  static String BUSINESS_TASK = 'work/business-process/tasks';
  static String BUSINESS_TEMPLATE = 'work/business-process/templates';
  static String BUSINESS = 'work/business-process';
  static String BUSINESS_PROJECT = 'work/business-process/projects';
  static String BUSINESS_STEP = 'work/business-process/steps';
  static String MOBILE_PROJECT = '$WORK_MOBILE/projects';
  static String ADD_TODO = 'work/tasks';
  static String EDIT_TODO = '$WORK_MOBILE/tasks';
  static String TASK_AND_TODOS = '$WORK_MOBILE/affiliated-tasks';

  static String REMINDER_REFERENCE = '$WORK/tasks/reminder-references';
  static String UNFINISH_TASK = '$WORK_MOBILE/my-unfinish-tasks';

  ///
  /// To-do Template
  static String TODO_TEMPLATE = 'work/settings/todo-templates';

  ///
  /// Attachment
  static String ADD_ATTACHMENT = 'work/attachments';

  ///
  /// Quotation
  static String QUOTATION = 'sales/quotations';
  static String SEARCH_PRODUCT = 'sales/products/base-lookup';
  static String RECENT_PRODUCT = 'sales/products/history-by-partner';

  static String DOCUMENT = 'sales/documents/exist-document-no';

  ///
  /// Order
  static String ORDER = 'sales/orders';

  /// Contract
  static String CONTRACT = 'sales/contracts';

  ///
  /// Payment
  static String PAYMENT = 'sales/payments';
  static String BANK_INFO = 'iam/tenants/current/bank-info';

  ///
  /// Activity
  static String TASK_ACTIVITIES = '$WORK/activity-logs';

  ///
  /// User profile
  static String USERS = "iam/users";
  static String AUTHENTICATION = "iam/authentication";
  static String LOGOUT = "$AUTHENTICATION/logout";
  static String SIGN_OUT_ALL = "$AUTHENTICATION/signout-all";
  static String USERS_TENANT = "$USERS/tenants";
  static String USERS_TENANT_INFO = "iam/tenants/info";
  static String SWITCH_TENANT = "$AUTHENTICATION/switch-tenant";
  static String LOGGED_DEVICES = "$AUTHENTICATION/logged-in-devices";
  static String DISABLE_ACCOUNT = "$AUTHENTICATION/disable";
  static String USERS_PREFERENCE = "$USERS/preferences/general";
  static String USERS_NOTIFICATION = "$USERS/preferences/notifications";
  static String USERS_NOTIFICATION_EMAIL =
      "$USERS/preferences/notifications/emails";
  static String PROFILE = "$USERS/profile";
  static String SWITCH_UNIQUE_TENANT = "$USERS/switch-unique-tenant";

  //Invitations
  static String PROJECT_INVITATION_TOKEN = "$USERS/invitations/projects";
  static String VALIDATE_PROJECT_INVITATION_TOKEN =
      "$PROJECT_INVITATION_TOKEN/validate-token";
  static String TENANT_INVITATION_TOKEN = "$USERS/invitations";
  static String VALIDATE_TENANT_INVITATION_TOKEN =
      "$TENANT_INVITATION_TOKEN/validate-token";

  ///
  /// Headline
  static String HEADLINE = "hub/headlines";
  static String IS_CONFLICT_TIME = "$HEADLINE/is-conflict-time";
  static String CURRENT_HEADLINE = "$HEADLINE/current";

  ///
  /// Note
  static String NOTE = "hub/notes";

  ///
  /// Request
  static String REQUEST = "requests";
  static String REQUEST_LEAVES = "$REQUEST/leaves";
  static String REQUEST_COMPENSATION = "$REQUEST/compensations";
  static String REQUEST_SETTING = "$REQUEST/general-settings";
  static String REQUEST_CF = "$REQUEST/form-custom";

  /// CRM - Delivery

  static String SHIPPING = "$SALES/deliveries/shipping-service-providers";

  ///Chat bot

  /// Terms & Privacy polocy
  static String TERMS =
      'https://cleeksy.com/phap-ly/dieu-khoan-dich-vu/mobile/';
  static String PRIVACY_POLICY =
      'https://cleeksy.com/phap-ly/chinh-sach-quyen-rieng-tu/mobile/';
  static String SETTING_NOTIFICATIONS =
      'https://support.cleeksy.com/gioi-thieu/tinh-huong-ap-dung/#cai-dat-thong-bao';

  ///Workspace
  static String WORKSPACE = '$WORK/workspaces';
  static String HUB_WORKSPACE = 'hub/workspace';
  static String WORKSPACE_BACKGROUND = '$WORKSPACE/background-image';
  static String WORKSPACE_BASIC_INFO = '$WORKSPACE/basic-info';
  static String WORKSPACE_DETAIL_INFO = '$WORKSPACE/detail-info';
  static String WORKSPACE_LOOKUP_INFO = '$PROJECT/workspace-info';

  /// My workspace overview
  static String TASK_COMPLETION_PROGRESS =
      '$WORK_MOBILE/task-completion-progress';
  static String MY_TASK_PREFERENCE_SETTINGS =
      '$WORK_MOBILE/my-task-preference-settings';

  ///Widget
  static String WIDGETS = "hub/widgets";
  static String DEFAULT_WIDGETS = 'hub/workspace/default-widgets';
  static String WIDGET_USAGES = 'hub/workspace/widget-usages';

  /// ACTIVITIES INBOX
  static String ACTIVITY_GROUPS = "hub/activity-groups";
  static String ACTIVITIES = "hub/activities";
  static String UNREAD_ACTIVITIES_COUNT =
      "$ACTIVITY_GROUPS/unread-activities-count";
  static String ACTIVITY_GROUPS_MARK_READ_ALL =
      "$ACTIVITY_GROUPS/mark-read-all";
  static String PINNED_ACTIVITY = "hub/pinned-activities";
  static String ACTIVITY_BOOKMARK = "hub/activity-bookmarks";

  ///DISCUSSION
  static String DISCUSSION = "hub/discussions";
  static String DISCUSSION_THREAD = "$DISCUSSION/threads";

  ///DOCUMENT
  static String DOCUMENTS = "document/documents";
  static String DOCUMENT_STORAGE = "document/storage";
  static String  VIEW_SETTING_DOCUMENT = "iam/users/preferences/document/storages/view-setting";
  static String DOCUMENT_STORAGE_FILE = "$DOCUMENT_STORAGE/files";
  static String DOCUMENT_STORAGE_FOLDER = "$DOCUMENT_STORAGE/folders";
  static String SHARED_STORAGE_CONTAINERS =
      "$DOCUMENT_STORAGE/containers/shared-with-me";
  static String BOOKMARKS = "$DOCUMENT_STORAGE/me/bookmarks";

  ///WATCH_LIST
  static String WATCH_LIST = "work/watchlists";

  /// GLOBAL SEARCH
  static String GLOBAL_SEARCH = "search";
  static String GLOBAL_SEARCH_SEARCH = "$GLOBAL_SEARCH/search";
  static String GLOBAL_SEARCH_HISTORY = "$GLOBAL_SEARCH/histories";

  /// CUSTOM APP
  static String CUSTOM_APP = "custom-app";
  static String CUSTOM_APP_BUILDER = "$CUSTOM_APP/app-builders";
  static String CUSTOM_APP_SUBMIT_FORM = "$CUSTOM_APP/submit-forms";
  static String CUSTOM_APP_PROJECT = "$CUSTOM_APP/projects";
  static String SHARED_MODULES = "$CUSTOM_APP/shared-modules";
  static String SHARED_MODULE_CRM = "$SHARED_MODULES/crm";
  static String CUSTOM_APP_UPLOAD_FILES =
      "$CUSTOM_APP/submit-forms/upload-files";
  static String CUSTOM_APP_FILE_URL = "$CUSTOM_APP/file/url";
  static String CUSTOM_APP_APPLIED_FORM = "$CUSTOM_APP/applied-forms";
  static String SUBMIT_PORTAL = "$CUSTOM_APP/submit-portals/current";
  static String MOBILE_SUBMIT_PORTAL_FORMS =
      "$SUBMIT_PORTAL/mobile/shared-forms";
  static String SUBMIT_PORTAL_SUBMITTED = "$SUBMIT_PORTAL/submits";
  static String MOBILE_SUBMIT_PORTAL_SUBMITTED =
      "$SUBMIT_PORTAL/mobile/submits";
  static String SHARED_PRIMARY_FORMS = "$CUSTOM_APP/shared-primary-forms";
  static String CUSTOM_APP_ALLOW_SUBMIT =
      "$CUSTOM_APP_SUBMIT_FORM/allow-submit";
  static String GLOBAL_SHARED_FORMS = "$SUBMIT_PORTAL/global/shared-forms";

  ///EMAIL-ACTION CTA
  static String WORK_EMAIL_ACTION = "work/email-actions";

  /// Community
  static String COMMUNITY = "community";
  static String COMMUNITY_TOPICS = "$COMMUNITY/topics";
  static String COMMUNITY_SPAMS = "$COMMUNITY/spams";
  static String COMMUNITY_CATEGORIES = "$COMMUNITY/categories";
  static String COMMUNITY_USERS = "$COMMUNITY/users";

  static String COMMUNITY_TICKET_FORM = "$CUSTOM_APP/crm/support-app";
  static String COMMUNITY_TOPICS_UPLOAD_FILES =
      "$COMMUNITY_TOPICS/files/upload";
  static String COMMUNITY_CURRENT_USER_ROLE = "$PROJECT/community/users/role";
  static String CHECK_COMMUNITY_URL = "$USERS/check-community-url";
  static String CHECK_EXIST_COMMUNITY_PROFILE =
      "$USERS/community-profile/exists";
  static String COMMUNITY_TOKENS = "$USERS/community-profile/token";
  static String COMMUNITY_PROFILE = "$USERS/community-profile";
  static String COMMUNITY_PROFILE_SETTING =
      "$COMMUNITY_USERS/community-profile/setting";

  /// MySpace
  static String UNREAD_COMMENTS = "$WORKSPACE/comments/notification";
  static String RECENTLY_PROJECTS = "$PROJECT/recently-projects";
  static String RECENTLY_DOCUMENTS = "$DOCUMENT_STORAGE/recently-files";
  static String MY_TASKS = "$WORK_MOBILE/tasks/my-task";
  static String MY_TASK_COUNT = "$WORK_MOBILE/tasks/my-task/count";
}
