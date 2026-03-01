# Presentation Layer Structure

This project keeps screen/UI flows in `lib/presentation/*` and feature data layers under `lib/features/*`.

## Current pattern

- `lib/presentation/*`:
  - All screen flows, including `auth_gate`, `login`, `signup`, and `phone_otp`
  - Each flow follows `screen + binding + controller (+models)` pattern
- `lib/features/*`:
  - Data/domain-focused modules (repositories, datasources, request/response models)

## Why this structure

- Keeps route and UI ownership in one place (`lib/presentation`).
- Keeps backend integration logic isolated from UI.
- Makes endpoint integration and testing cleaner.

## API integration entry points

- `lib/core/network/api_client.dart` → Plug your HTTP client.
- `lib/core/network/api_endpoints.dart` → Set real endpoint paths.
- `lib/features/auth/data/datasources/auth_remote_data_source.dart` → Parse backend responses.

## Recommended migration approach

1. Keep screens/controllers/bindings inside `lib/presentation/<flow>/`.
2. Keep API models/repositories/datasources inside `lib/features/<flow>/data/`.
3. Wire routes only from `lib/routes/app_routes.dart`.
4. Add real endpoints in `api_endpoints.dart` and concrete HTTP in `api_client.dart`.
