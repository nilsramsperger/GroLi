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
- [x] Add a removeProduct() func to the ViewModel and test it
- [ ] Add swipe left with remove button for iOS to the View
- [ ] Create UITest for the swipe remove
- [ ] Add context menu with remove button for  iPadOS and macOS to the View
- [ ] Create UITest for the context menu remove

### Make the list sortable
- [ ] _tbd_

### Switch to CoreData and iCloudKit for storage
- [ ] _tbd_

## Questions
- Can ViewModel tests be omitted, if UITests are present?
