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
- [ ] Add add() func to the repo
- [ ] create and test AddProductUseCase
- [ ] Add a addProduct() func to the ViewModel and test it
- [ ] Add a plus button with functionality to the View
- [ ] Create a UITest for the plus button 

### Remove products from the list
- [ ] _tbd_

### Make the list sortable
- [ ] _tbd_

### Switch to CoreData and iCloudKit for storage
- [ ] _tbd_
