# GroLi
Smart Grocery List

## ToDo
### Read static in-memory list and display it
- [x] Change ListProductsUseCase to return the list in order by rank
  - [x] Write UnitTest for this
- [x] Add a ProductsInMemoryRepository
- [x] Add a ShoppingListViewModel
  - [x] Create UnitTests
- [x] Add a ShoppingListView
  - [x] Display View in App as default View
  - [x] Create Factory to bootstrap the dep-tree
 
### Add products to the list
- [x] Add add() func to the repo
- [x] create and test AddProductUseCase
- [x] Add a addProduct() func to the ViewModel and test it
- [x] Add a plus button with functionality for iOS to the View
- [x] Add context menu with plus button for iPadOS and macOS to the View

### Remove products from the list
- [x] Add remove() func to the repo
- [x] create and test removeProductUseCase
- [x] Add a deleteItem() func to the ViewModel and test it
- [x] Add swipe left with remove button for iOS to the View
- [x] Add context menu with remove button for  iPadOS and macOS to the View

### Make the list sortable
- [x] Create a ReorderProductsUseCase
  - reorder(by ids: [UUID])
  - write a rest
- [x] Add a reorderItems(items: [Product]) Method to the ShoppingListViewModel
- [x] Add dragndrop to macOS View
- [x] Add dragndrop to iOS View
  - [x] Implement Swipe to delete without List
  - [x] Set item background for larger drag tap area
  
### Persist item checkbox
- [x] Create toggleProductChecked() in ShoppingListUseCase
  - test it
- [x] Listen to change of checkbox and trigger usecase

### Security etc.
- [ ] Add Validation for product name input

### Switch to CoreData and iCloudKit for storage
- [ ] Implement a CoreData based repository
  - Intgrate shema version fields into each record
- [ ] Integrate iCloud private database
- [ ] Integrate iCloud shared database

### Misc
- [ ] Add app icon
- [ ] Add schema update logic
- [x] Combine all ShoppingList use cases into one
- [ ] Separate Views for iOS and macOS
- [ ] Style the SwipeableProductView
- [ ] Integration tests for ShoppingListViewModel
  - Remove obsolete UnitTests

### UI tests
- iOS
  - [ ] Create UITest for the plus button
  - [ ] Create UITest for the swipe remove
  - [ ] Create UITest for sorting
  - [ ] Add UITest for checking
- macOS
  - [ ] Create UITest for the context menu plus button
  - [ ] Create UITest for the context menu remove
  - [ ] Create UITest for sorting
  - [ ] Add UITest for checking
- [ ] Make all Tests run in CI

## Milestones
- Milestone 1: Create a shared editable list 
- Milestone 2: List of shops with individual shopping lists
- _tbd_

## Test Strategy
- The business logic should be covered by unit tests
- Integration tests should be spanning from ViewModels to in-memory storage
- UI tests should be created for the main user interaction paths

