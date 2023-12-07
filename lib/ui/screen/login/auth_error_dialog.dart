import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthErrorDialog extends StatelessWidget {
  const AuthErrorDialog({super.key, required this.error});

  final FirebaseAuthException error;

  @override
  Widget build(BuildContext context) {
    var message = '';

    switch (error.code) {
      case 'invalid-email':
        message = 'メールアドレスが不正です';
      case 'user-disabled':
        message = 'ユーザーが無効です';
      case 'user-not-found':
        message = 'ユーザーが見つかりません';
      case 'wrong-password':
        message = 'パスワードが間違っています';
      case 'email-already-in-use':
        message = 'メールアドレスは既に使用されています';
      case 'operation-not-allowed':
        message = 'この操作は許可されていません';
      case 'weak-password':
        message = 'パスワードが弱すぎます';
      default:
        message = 'エラーが発生しました';
    }

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      title: Icon(
        Icons.error,
        color: Theme.of(context).colorScheme.error,
        size: 48,
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onErrorContainer,
          fontSize: 16,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onError,
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('OK'),
          ),
        ),
      ],
    );
  }
}
