
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:pizza_app/src/providers/authentication.dart';

enum AuthState { Authenticated, Authenticating, Unauthenticated }

class AuthProvider extends ChangeNotifier {

  BaseAuth _auth;

  AuthState _state = AuthState.Unauthenticated;

  AuthState get state => _state;

  AuthProvider.instance() : _auth = Auth.instance {
    _auth.onAuthStateChanged().listen(_onAuthStateChanged);
  }

  Future<void> signIn(String email, String password) async {
    try {
      _state = AuthState.Authenticating;
      notifyListeners();

      await _auth.signIn(email, password);

    } catch (e) {
      _state = AuthState.Unauthenticated;
      notifyListeners();

      throw(e);
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      _state = AuthState.Authenticating;
      notifyListeners();

      String result = await _auth.signUp(email, password);

      if (result != null) {
        await _auth.signIn(email, password);
      }

    } catch (e) {
      _state = AuthState.Unauthenticated;
      notifyListeners();

      throw(e);
    }
  }

  Future signOut() async {
    _auth.signOut();
    _state = AuthState.Unauthenticated;
    notifyListeners();

    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser user) async {
    if (user == null) {
      _state = AuthState.Unauthenticated;
    } else {
      _state = AuthState.Authenticated;
    }

    notifyListeners();
  }

}
