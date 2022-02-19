# Install the CLI if not already done so

dart pub global activate flutterfire_cli

# Generate codes from models like json annotation by running the command below

flutter pub run build_runner build

# Run the `configure` command, select a Firebase project and platforms

flutterfire configure

# Run command on web

flutter run -d chrome --web-renderer html
