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
  - [ ] Create UITests
- [ ] Make all Tests run in CI
 
### Add products to the list
- [x] Add add() func to the repo
- [x] create and test AddProductUseCase
- [x] Add a addProduct() func to the ViewModel and test it
- [x] Add a plus button with functionality for iOS to the View
- [ ] Create a UITest for the plus button 
- [x] Add context menu with plus button for iPadOS and macOS to the View
- [ ] Create a UITest for the context menu plus button 

### Remove products from the list
- [x] Add remove() func to the repo
- [x] create and test removeProductUseCase
- [x] Add a deleteItem() func to the ViewModel and test it
- [ ] Add a test for mutliple deletes on deleteItems
- [x] Add swipe left with remove button for iOS to the View
- [ ] Create UITest for the swipe remove
- [x] Add context menu with remove button for  iPadOS and macOS to the View
- [ ] Create UITest for the context menu remove

### Make the list sortable
- [x] Create a ReorderProductsUseCase
  - reorder(by ids: [UUID])
  - write a rest
- [x] Add a reorderItems(items: [Product]) Method to the ShoppingListViewModel
- [x] Add dragndrop to macOS View
- [ ] Add dragndrop to iOS View
  - [ ] Implement Swipe to delete without List
  - [ ] Set item background for larger drag tap area
- [ ] Add UITest for sorting
  
### Persist item checkbox
- [ ] Create ToggleProductCheckedUseCase
  - test it
- [ ] Listen to change of checkbox and trigger usecase
- [ ] Add UITest for checking

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

## Questions
- Can ViewModel tests be omitted, if UITests are present?

## Milestones
### Milestone 1: Create a shared editable list 
### Milestone 2: List of shops with individual shopping lists
### _tbd_
