// models/product.dart
class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Map<String, double> dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Map<String, dynamic> meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return Product(
  //     id: json['id'],
  //     title: json['title'],
  //     description: json['description'],
  //     category: json['category'],
  //     price: json['price'].toDouble(),
  //     discountPercentage: json['discountPercentage'].toDouble(),
  //     rating: json['rating'].toDouble(),
  //     stock: json['stock'],
  //     tags: List<String>.from(json['tags']),
  //     brand: json['brand'],
  //     sku: json['sku'],
  //     weight: json['weight'].toDouble(),
  //     dimensions: {
  //       'width': json['dimensions']['width'].toDouble(),
  //       'height': json['dimensions']['height'].toDouble(),
  //       'depth': json['dimensions']['depth'].toDouble(),
  //     },
  //     warrantyInformation: json['warrantyInformation'],
  //     shippingInformation: json['shippingInformation'],
  //     availabilityStatus: json['availabilityStatus'],
  //     reviews:
  //         (json['reviews'] as List).map((e) => Review.fromJson(e)).toList(),
  //     returnPolicy: json['returnPolicy'],
  //     minimumOrderQuantity: json['minimumOrderQuantity'],
  //     meta: json['meta'],
  //     images: List<String>.from(json['images']),
  //     thumbnail: json['thumbnail'],
  //   );
  // }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price:
          json['price']?.toDouble() ?? 0.0, // Use ?. to safely access toDouble
      discountPercentage:
          json['discountPercentage']?.toDouble() ??
          0.0, // Use ?. to safely access toDouble
      rating:
          json['rating']?.toDouble() ?? 0.0, // Use ?. to safely access toDouble
      stock: json['stock'] ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.cast<String>() ??
          [], // Handle potential null list
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight:
          json['weight']?.toDouble() ?? 0.0, // Use ?. to safely access toDouble
      dimensions:
          (json['dimensions'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, value.toDouble()),
          ) ??
          {}, // Handle potential null map
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [], // Handle potential null list
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      meta: json['meta'] ?? {},
      images:
          (json['images'] as List<dynamic>?)?.cast<String>() ??
          [], // Handle potential null list
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}

class Review {
  final double rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'].toDouble(),
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}
