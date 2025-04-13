library;

// 3rd party libraries
export 'package:intl/intl.dart';
export 'package:timezone/data/latest.dart';
export 'package:timezone/timezone.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:hooks_riverpod/hooks_riverpod.dart';
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:shared_preferences/shared_preferences.dart';

// other
export 'src/http_overrides.dart';
export 'src/styles/ordrer_colors.dart';
export 'src/providers.dart';

// controllers
export 'src/controllers/case_controller.dart';

// repos
export 'src/repositories/case_repostiory.dart';
export 'src/repositories/user_repository.dart';
export 'src/repositories/vacation_repository.dart';
export 'src/repositories/holiday_repository.dart';
export 'src/repositories/assignment_repository.dart';

// domain
export 'src/domain/users/user.dart';
export 'src/domain/users/user_info.dart';
export 'src/domain/vacation/vacation.dart';
export 'src/domain/vacation/holiday.dart';
export 'src/domain/vacation/vacation_wrapper.dart';
export 'src/domain/assignment/assignment.dart';
export 'src/domain/date_calendar.dart';

export 'src/domain/case/case.dart';
export 'src/domain/case/hour_aggregate.dart';
export 'src/domain/case/case_estimated_hour.dart';
export 'src/domain/case/economy.dart';
export 'src/domain/case/contact_person.dart';
export 'src/domain/case/sales_invoice.dart';

// utils
export 'src/utils/app_extensions.dart';
export 'src/utils/enum_extensions.dart';
export 'src/utils/domain_extensions.dart';
export 'src/utils/date_time_extension.dart';
export 'src/utils/debounce.dart';
export 'src/utils/constants.dart';
export 'src/utils/help_methods.dart';

// widgets
export 'src/firebase_options.dart';
export 'src/common_widgets/common_async_widget.dart';
export 'src/common_widgets/app_dialog.dart';
export 'src/common_widgets/dialogs/user_list_dialog.dart';
export 'src/common_widgets/color_row.dart';
export 'src/common_widgets/containers/date_selection_container.dart';
export 'src/common_widgets/charts/progress_bar.dart';
export 'src/common_widgets/containers/app_container.dart';
export 'src/common_widgets/containers/icon_container.dart';
export 'src/common_widgets/text/title_text.dart';
export 'src/common_widgets/text/title_large.dart';
export 'src/common_widgets/text/caption_text.dart';
export 'src/common_widgets/list/scroll_with_bar.dart';
export 'src/common_widgets/list/case_list_view.dart';
export 'src/common_widgets/production_case_item.dart';
export 'src/common_widgets/calendar/week_top_view.dart';
export 'src/common_widgets/calendar/calendar_view.dart';
export 'src/common_widgets/listeners/shift_scroll_listener.dart';
export 'src/common_widgets/dialogs/editor_dialog_top_bar.dart';

// responsive
export 'src/common_widgets/responsive/responsive_widget.dart';
