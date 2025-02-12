// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:hestia/presentation/common/views/authentication.dart' as _i2;
import 'package:hestia/presentation/guards/views/codes_log.dart' as _i4;
import 'package:hestia/presentation/guards/views/home.dart' as _i5;
import 'package:hestia/presentation/guards/views/layout.dart' as _i6;
import 'package:hestia/presentation/residents/views/account/account.dart'
    as _i7;
import 'package:hestia/presentation/residents/views/account/account_shell.dart'
    as _i1;
import 'package:hestia/presentation/residents/views/community/community.dart'
    as _i9;
import 'package:hestia/presentation/residents/views/community/community_codes.dart'
    as _i8;
import 'package:hestia/presentation/residents/views/community/community_shell.dart'
    as _i3;
import 'package:hestia/presentation/residents/views/home/home.dart' as _i10;
import 'package:hestia/presentation/residents/views/layout.dart' as _i11;
import 'package:hestia/presentation/residents/views/services/services.dart'
    as _i12;
import 'package:hestia/presentation/residents/views/services/services_shell.dart'
    as _i13;

/// generated route for
/// [_i1.AccountShell]
class AccountShell extends _i14.PageRouteInfo<void> {
  const AccountShell({List<_i14.PageRouteInfo>? children})
      : super(
          AccountShell.name,
          initialChildren: children,
        );

  static const String name = 'AccountShell';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountShell();
    },
  );
}

/// generated route for
/// [_i2.AuthenticationPage]
class AuthenticationRoute extends _i14.PageRouteInfo<void> {
  const AuthenticationRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthenticationPage();
    },
  );
}

/// generated route for
/// [_i3.CommunityShell]
class CommunityShell extends _i14.PageRouteInfo<void> {
  const CommunityShell({List<_i14.PageRouteInfo>? children})
      : super(
          CommunityShell.name,
          initialChildren: children,
        );

  static const String name = 'CommunityShell';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.CommunityShell();
    },
  );
}

/// generated route for
/// [_i4.GuardsCodesLogPage]
class GuardsCodesLogRoute extends _i14.PageRouteInfo<void> {
  const GuardsCodesLogRoute({List<_i14.PageRouteInfo>? children})
      : super(
          GuardsCodesLogRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuardsCodesLogRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.GuardsCodesLogPage();
    },
  );
}

/// generated route for
/// [_i5.GuardsHomePage]
class GuardsHomeRoute extends _i14.PageRouteInfo<void> {
  const GuardsHomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          GuardsHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuardsHomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.GuardsHomePage();
    },
  );
}

/// generated route for
/// [_i6.GuardsLayoutPage]
class GuardsLayoutRoute extends _i14.PageRouteInfo<void> {
  const GuardsLayoutRoute({List<_i14.PageRouteInfo>? children})
      : super(
          GuardsLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuardsLayoutRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.GuardsLayoutPage();
    },
  );
}

/// generated route for
/// [_i7.ResidentsAccountPage]
class ResidentsAccountRoute extends _i14.PageRouteInfo<void> {
  const ResidentsAccountRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ResidentsAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResidentsAccountRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.ResidentsAccountPage();
    },
  );
}

/// generated route for
/// [_i8.ResidentsCommunityCodes]
class ResidentsCommunityCodes extends _i14.PageRouteInfo<void> {
  const ResidentsCommunityCodes({List<_i14.PageRouteInfo>? children})
      : super(
          ResidentsCommunityCodes.name,
          initialChildren: children,
        );

  static const String name = 'ResidentsCommunityCodes';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.ResidentsCommunityCodes();
    },
  );
}

/// generated route for
/// [_i9.ResidentsCommunityPage]
class ResidentsCommunityRoute extends _i14.PageRouteInfo<void> {
  const ResidentsCommunityRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ResidentsCommunityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResidentsCommunityRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.ResidentsCommunityPage();
    },
  );
}

/// generated route for
/// [_i10.ResidentsHomePage]
class ResidentsHomeRoute extends _i14.PageRouteInfo<ResidentsHomeRouteArgs> {
  ResidentsHomeRoute({
    _i15.Key? key,
    required String userName,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ResidentsHomeRoute.name,
          args: ResidentsHomeRouteArgs(
            key: key,
            userName: userName,
          ),
          initialChildren: children,
        );

  static const String name = 'ResidentsHomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResidentsHomeRouteArgs>();
      return _i10.ResidentsHomePage(
        key: args.key,
        userName: args.userName,
      );
    },
  );
}

class ResidentsHomeRouteArgs {
  const ResidentsHomeRouteArgs({
    this.key,
    required this.userName,
  });

  final _i15.Key? key;

  final String userName;

  @override
  String toString() {
    return 'ResidentsHomeRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [_i11.ResidentsLayoutPage]
class ResidentsLayoutRoute
    extends _i14.PageRouteInfo<ResidentsLayoutRouteArgs> {
  ResidentsLayoutRoute({
    _i15.Key? key,
    required String userName,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ResidentsLayoutRoute.name,
          args: ResidentsLayoutRouteArgs(
            key: key,
            userName: userName,
          ),
          initialChildren: children,
        );

  static const String name = 'ResidentsLayoutRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResidentsLayoutRouteArgs>();
      return _i11.ResidentsLayoutPage(
        key: args.key,
        userName: args.userName,
      );
    },
  );
}

class ResidentsLayoutRouteArgs {
  const ResidentsLayoutRouteArgs({
    this.key,
    required this.userName,
  });

  final _i15.Key? key;

  final String userName;

  @override
  String toString() {
    return 'ResidentsLayoutRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [_i12.ResidentsServicesPage]
class ResidentsServicesRoute extends _i14.PageRouteInfo<void> {
  const ResidentsServicesRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ResidentsServicesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResidentsServicesRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.ResidentsServicesPage();
    },
  );
}

/// generated route for
/// [_i13.ServicesShell]
class ServicesShell extends _i14.PageRouteInfo<void> {
  const ServicesShell({List<_i14.PageRouteInfo>? children})
      : super(
          ServicesShell.name,
          initialChildren: children,
        );

  static const String name = 'ServicesShell';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.ServicesShell();
    },
  );
}
