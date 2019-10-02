- What classes does each implementation include? Are the lists the same?

Implementations A and B have the same classes: CartEntry, ShoppingCart, and Order.

- Write down a sentence to describe each class.

CartEntry: This object is a specific item, it's price and quantity are stored
ShoppingCart: A list of all items in a cart
Order: A shopping cart of items

- How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

The Order class is instantiated with a ShoppingCart class.  The ShoppingCart stores an array of entries made up of the CartEntry class.

Order is one-to-one with ShoppingCart
ShoppingCart is one-to-many with CartEntry

- What data does each class store? How (if at all) does this differ between the two implementations?

There is no difference in the data stored, the initialize methods are unchanged between the implementation:
CartEntry stores unit_price and quantity
ShoppingCart stores entries
Order stores cart

- What methods does each class have? How (if at all) does this differ between the two implementations?

CartEntry: has a price method in implementation B and no methods in implementation A
Shopping Cart: has a price method in implementation B and no methods in implementation A
Order: has a total_price method - this is the same for both implementations

- Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?

In implementation A the logic to compute price is retained in Order; however, in implementation B the logic is in ShoppingCart and CartEntry

- Does total_price directly manipulate the instance variables of other classes?

Total_price directly manipulates the instance variables in implementation A, but not B

- If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?

This would change either the total_price method in implementation A of the price method of CartEntry is implementation B.  Implementation B would be easier to modify.

- Which implementation better adheres to the single responsibility principle?

Implementation B

- Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?

Implementation B (fewer dependencies)

Describe in design-activity.md what changes you would need to make to improve this design, and how the resulting design would be an improvement.

