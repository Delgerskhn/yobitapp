# Install the CLI if not already done so

dart pub global activate flutterfire_cli

# Run the `configure` command, select a Firebase project and platforms

flutterfire configure

# Run command on web

flutter run -d chrome --web-renderer html
