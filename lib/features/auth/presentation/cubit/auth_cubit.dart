import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/manager_credentials.dart';
import '../../domain/entities/app_role.dart';


class AuthState {
  final AppRole? role;
  final String? errorMessage;

  const AuthState({this.role, this.errorMessage});

  bool get isManager => role == AppRole.manager;
  bool get isEmployee => role == AppRole.employee;
  bool get roleSelected => role != null;

  AuthState copyWith({AppRole? role, String? errorMessage}) {
    return AuthState(
      role: role ?? this.role,
      errorMessage: errorMessage,
    );
  }
}


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void continueAsEmployee() {
    emit(const AuthState(role: AppRole.employee));
  }
  bool loginAsManager({required String username, required String password}) {
    final isValid = ManagerCredentials.matches(
      username: username.trim(),
      password: password,
    );

    if (isValid) {
      emit(const AuthState(role: AppRole.manager));
    } else {
      emit(AuthState(
        role: state.role,
        errorMessage: 'اسم المستخدم أو كلمة السر غير صحيحة',
      ));
    }
    return isValid;
  }

  void clearError() {
    if (state.errorMessage != null) {
      emit(AuthState(role: state.role));
    }
  }

  void logout() {
    emit(const AuthState());
  }
}
