import 'package:firebase_auth/firebase_auth.dart';

/// Repository layer for all authentication operations.
///
/// This class isolates Firebase SDK calls from UI/controller code so the
/// feature remains easier to test and maintain.
class AuthRepository {
  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  /// Emits the current auth state.
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  /// Signs in user with email and password.
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Creates a new account with email and password.
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Starts phone number verification (OTP flow).
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Duration timeout,
    int? forceResendingToken,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) {
    return _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: timeout,
      forceResendingToken: forceResendingToken,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  /// Verifies OTP code and signs in user.
  Future<UserCredential> verifyOtpAndSignIn({
    required String verificationId,
    required String smsCode,
  }) {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return _firebaseAuth.signInWithCredential(credential);
  }

  /// Signs out current user.
  Future<void> signOut() => _firebaseAuth.signOut();
}
