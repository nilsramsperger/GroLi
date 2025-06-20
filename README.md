# GroLi
Smart Grocery List

## ToDo
### Security etc.
- [x] Add BL validation for product name input
- [x] Add UI validation for product name input
- [ ] Display errors from BL in UI
  - Global blocking display of message 
  - No usage of app allowed

### Switch to CoreData and iCloudKit for storage
- [x] Implement a CoreData based repository
- [x] Integrate schema version fields into each record
- [x] Integrate iCloud private database
- [ ] Integrate iCloud shared database

### Misc
- [x] Add app icon
- [ ] Add schema update logic
  - Record version above App -> Ask user for update
  - Record version below App -> Update record
- [x] Combine all ShoppingList use cases into one
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

## Ideas for later milestones
- [ ] Edit mode for products
  - Substitute for the "Add product sheet"
  - Adding must be indepenent of the edit mode, because it is not clear in which list the product will end up.
- [ ] Limit the number of products in the list
- [ ] Limit the number of shops
