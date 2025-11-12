db = db.getSiblingDB('moviedb');

db.users.insertMany([
  { name: "Mobarak", favMovie: "Inception" },
  { name: "Anjana", favMovie: "The Harry Potter" }
]);

print("✅ Sample data inserted!");
