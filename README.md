# GroLi
Smart Grocery List

## ToDo
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

