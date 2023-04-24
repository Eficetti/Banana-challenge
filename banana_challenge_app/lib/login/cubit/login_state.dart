/// The status of the login form.
enum LoginStatus {
  /// The form is being validated.
  initial,

  /// The form is being submitted.
  attempting,

  /// The form has been submitted successfully.
  success,

  /// The form has been submitted unsuccessfully.
  error;

  bool get isAttempting => this == LoginStatus.attempting;
  bool get isInitial => this == LoginStatus.initial;
  bool get isSuccess => this == LoginStatus.success;
  bool get isError => this == LoginStatus.error;
}

class LoginState {
  const LoginState({
    this.status = LoginStatus.initial,
    this.username,
    this.password,
    this.loginErrorMessage,
  });

  bool get isAttempting => status == LoginStatus.attempting;

  final LoginStatus status;
  final String? loginErrorMessage;
  final String? username;
  final String? password;

  LoginState copyWith({
    LoginStatus? status,
    String? username,
    String? password,
    String? loginErrorMessage,
  }) {
    return LoginState(
      loginErrorMessage: loginErrorMessage,
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  List<Object?> get props => [
        status,
        username,
        password,
        loginErrorMessage,
      ];
}
