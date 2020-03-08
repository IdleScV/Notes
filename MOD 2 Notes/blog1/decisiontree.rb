require 'decisiontree'
labels = ["tired", "cash", "fridge_stocked" ]
training = [
        [1, 30, 1, "Order Out"],
        [1, 30, 0, "Order Out"],
        [1, 20, 1, "Cook"],
        [1, 20, 0, "Buy Groceries"],
        [0, 30, 1, "Cook"],
        [0, 30, 0, "Order Out"],
        [0, 20, 1, "Cook"],
        [0, 20, 0, "Buy Groceries"]
]

dec_tree = DecisionTree::ID3Tree.new(labels, training, "Order Out", tired: :discrete, cash: :continuous, fridge_stocked: :discrete)
#* Here we train our model
dec_tree.train

test = [0, 20, 0, "Cook"]
decision = dec_tree.predict(test)
puts "Predicted: #{decision} ... True decision: #{test.last}"


Output => Predicted: Buy Groceries ... True decision: Cook