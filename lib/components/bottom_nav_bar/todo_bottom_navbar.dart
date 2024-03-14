import 'package:flutter/material.dart';
import 'package:todo_app/screens/todo_completed.dart';
import 'package:todo_app/screens/todo_home.dart';

// Class definition for the bottom navigation bar
class TodoBottomNavigationBar extends StatefulWidget {
  const TodoBottomNavigationBar({super.key});

  @override
  State<TodoBottomNavigationBar> createState() =>
      _TodoBottomNavigationBarState();
}

// State class for managing the bottom navigation bar
class _TodoBottomNavigationBarState extends State<TodoBottomNavigationBar> {
  // Variable to store the currently selected tab index (0 or 1)
  int _selectedIndex = 0;
  // List containing the screens to be displayed based on the selected tab
  static const List<Widget> _destination = [TodoHome(), TodoCompletedScreen()];
  // Function to handle user interaction with the bottom navigation bar
  void _onDestinationSelected(int index) {
    // Update the selected tab index and rebuild the UI
    setState(() {
      _selectedIndex = index;
    });
  }

// Called whenever dependencies change
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

// Builds the UI for the bottom navigation bar
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      // Display the currently selected screen from the _destination list
      body: _destination.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        elevation: 5,
        selectedItemColor: theme.colorScheme.primary.withOpacity(0.6),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: theme.textTheme.bodySmall,
        selectedLabelStyle: theme.textTheme.bodySmall,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onDestinationSelected,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/img_playlist.png"), label: 'All'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed')
        ],
      ),
    );
  }
}
