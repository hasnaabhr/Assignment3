import 'dart:io';

void main() {
  // List to store items
  List<String> items = [];
  int? option;

  //do-while loop to continue display menu until user want to exit
  do {
    displayMenu();
    //ask user to input an option
    print("choose the option you want");

    //convert user input from string to int
    option = int.parse(stdin.readLineSync()!);
    //validate user input
    if (option < 1 || option > 5) {
      print("Invalid choice, Please select an option between 1 and 5.");
    }

    // Handle menu options
    switch (option) {
      case 1:
        addItemFunction(items);
        break;
      case 2:
        removeItemFunction(items);
        break;
      case 3:
        sortAndDisplayList(items);
        break;
      case 4:
        searchFunction(items);
        break;
      case 5:
        print("Exiting the program");
        break;
      default:
        print("Invalid choice, Please select an option between 1 and 5.");
    }
  } while (option != 5);
}

// Function to display menu
void displayMenu() {
  print("\n=== Grocery List Manager ===");
  print("1. Add Item");
  print("2. Remove Item");
  print("3. View and Sort List");
  print("4. Search for Item");
  print("5. Exit");
  print("============================");
}

// Add item function
void addItemFunction(List<String> items) {
  print("Enter the item to add");
  String? item = stdin.readLineSync();

  if (item == null || item.trim().isEmpty) {
    print("Invalid input, Item cannot be empty.");
    return;
  }
  if (items.contains(item)) {
    print("Item already exists in the list.");
    return;
  }

  items.add(item.trim());
  print("'$item' has been added to the list.");
}

// Remove item function
void removeItemFunction(List<String> items) {
  if (items.isEmpty) {
    print("The list is empty, Nothing to remove.");
    return;
  }

  print("Enter the item to remove:");
  String? item = stdin.readLineSync();

  if (item == null || item.trim().isEmpty) {
    print("Invalid input. Item cannot be empty.");
    return;
  }

  if (items.remove(item)) {
    print("'$item' has been removed from the list.");
  } else {
    print("Item '$item' does not exist in the list.");
  }
}

// Sort and display the list
void sortAndDisplayList(List<String> items, {String format = "as-is"}) {
  if (items.isEmpty) {
    print("The grocery list is empty.");
    return;
  }

  // Sort the list alphabetically
  items.sort();
  print("\nSorted Grocery List:");

  // Use a for loop to display sorted items with formatting
  for (int i = 0; i < items.length; i++) {
    String formattedItem;
    switch (format) {
      case "uppercase":
        formattedItem = items[i].toUpperCase();
        break;
      case "lowercase":
        formattedItem = items[i].toLowerCase();
        break;
      default:
        formattedItem = items[i];
    }
    print("- $formattedItem");
  }
}

// Search for an item
void searchFunction(List<String> items) {
  if (items.isEmpty) {
    print("The list is empty. Nothing to search.");
    return;
  }

  print("Enter the item to search for:");
  String? item = stdin.readLineSync();

  if (item == null || item.trim().isEmpty) {
    print("Invalid input. Item cannot be empty.");
    return;
  }

  int index = items.indexOf(item.trim());
  if (index == -1) {
    print("Item '$item' was not found in the list.");
  } else {
    print("Item '$item' found at position ${index + 1}.");
  }
}
