import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:tme_store/api/models/models.dart';

void main() {
  test("ApiPrice deserialization test ", () async {
    String str = """
    {
            "Amount": 10,
            "PriceValue": 0.05836,
            "PriceBase": 0,
            "Special": false
          }
          """;
    ApiPrice price = ApiPrice.fromJson(json.decode(str));

    expect(price.amount, 10);
    expect(price.value, 0.05836);
    expect(price.isSpecial, false);
  });

  test("ApiProductPriceWithStock deserialization test ", () async {
    String str = """
    {
        "Symbol": "FIX-LED-6501",
        "PriceList": [
          {
            "Amount": 10,
            "PriceValue": 0.05836,
            "PriceBase": 0,
            "Special": false
          },
          {
            "Amount": 50,
            "PriceValue": 0.03624,
            "PriceBase": 0,
            "Special": false
          },
          {
            "Amount": 100,
            "PriceValue": 0.02605,
            "PriceBase": 0,
            "Special": false
          },
          {
            "Amount": 1000,
            "PriceValue": 0.02037,
            "PriceBase": 0,
            "Special": false
          }
        ],
        "Amount":500,
        "Unit": "szt",
        "VatRate": 23,
        "VatType": "VAT"
      }
      """;

    var product = ApiProductPriceWithStock.fromJson(json.decode(str));

    expect(product.amount, 500);
    expect(product.symbol, "FIX-LED-6501");
    expect(product.unit, "szt");
    expect(product.vatRate, 23);
    expect(product.vatType, "VAT");
    expect(product.prices.length, 4);
  });

  test("ApiResponse of ApiProductPriceWithStock deserialization test ",
      () async {
    String str = """
    {
  "Status": "OK",
  "Data": {
    "Currency": "EUR",
    "Language": "PL",
    "PriceType": "NET",
    "ProductList": [
      {
        "Symbol": "PLED-HOLDER-WH",
        "PriceList": [
          {
            "Amount": 5,
            "PriceValue": 0.055,
            "PriceBase": 0,
            "Special": false
          }
        ],
        "Unit": "szt",
        "VatRate": 23,
        "VatType": "VAT"
      }
    ]
  }
}
      """;

    var response =
        ApiResponse.fromJson<ApiGetPricesAndStockResult>(json.decode(str));

    expect(response.status, "OK");
    expect(response.data.currency, "EUR");
    expect(response.data.language, "PL");
    expect(response.data.priceType, "NET");
    expect(response.data.products.length, 1);
  });

  test("ApiResponse error deserialization test ", () async {
    String str = """
    {
  "Status": "E_AUTHENTICATION_FAILED",
  "Data": [],
  "ErrorMessage": "Authentication failed",
  "Error": []
}
      """;

    var response =
        ApiResponse.fromJson<ApiGetPricesAndStockResult>(json.decode(str));

    expect(response.status, "E_AUTHENTICATION_FAILED");
    expect(response.data, null);
    expect(response.errorMessage, "Authentication failed");
  });

  test("ApiProduct deserialization test", () async {
    String str = """
    {
        "Symbol": "PLED-HOLDER-WH",
        "OriginalSymbol": "POWER LED HOLDER WHITE",
        "Producer": "OPTOSUPPLY",
        "Description": "Obudowa diody LED; 8mm; biały",
        "CategoryId": "100324",
        "Category": "Oprawki",
        "Photo": "\/\/static.tme.eu\/products_pics\/4\/3\/5\/435fc49d5c04ef5ce436709ccac55304\/373351.jpg",
        "Thumbnail": "\/\/static.tme.eu\/products_pics\/4\/3\/5\/435fc49d5c04ef5ce436709ccac55304\/373351_t.jpg",
        "Weight": 1.593,
        "SuppliedAmount": 0,
        "MinAmount": 5,
        "Multiples": 1,
        "ProductStatusList": [],
        "Unit": "szt",
        "OfferId": "",
        "CustomerSymbol": "",
        "ProductInformationPage": "\/\/www.tme.eu\/pl\/details\/pled-holder-wh\/oprawki\/optosupply\/power-led-holder-white\/",
        "Guarantee": null
      }
          """;

    ApiProduct product = ApiProduct.fromJson(json.decode(str));

    expect(product.symbol, "PLED-HOLDER-WH");
    expect(product.originalSymbol, "POWER LED HOLDER WHITE");
    expect(product.producer, "OPTOSUPPLY");
    expect(product.description, "Obudowa diody LED; 8mm; biały");
    expect(product.categoryId, "100324");
    expect(product.category, "Oprawki");
    expect(product.weight, 1.593);
    expect(product.suppliedAmount, 0);
    expect(product.minAmount, 5);
    expect(product.multiplies, 1);
    expect(product.productStatusList.length, 0);
    expect(product.unit, "szt");
    expect(product.guarantee, null);
    expect(product.offerId, "");
    expect(product.photoUrl, "\/\/static.tme.eu\/products_pics\/4\/3\/5\/435fc49d5c04ef5ce436709ccac55304\/373351.jpg");
    expect(product.thumbnailUrl, "\/\/static.tme.eu\/products_pics\/4\/3\/5\/435fc49d5c04ef5ce436709ccac55304\/373351_t.jpg");
  });


  test("ApiSearchResult deserialization test ", () async {
    String str = """
     {
    "ProductList": [
      {
        "Symbol": "FIX-LED-301A",
        "OriginalSymbol": "FIX-LED-301A",
        "Producer": "FIX&FASTEN",
        "Description": "Obudowa diody LED; 3mm; poliamid; kątowa; czarny; UL94V-2; H:7,4mm",
        "CategoryId": "100324",
        "Category": "Oprawki",
        "Photo": "\/\/static.tme.eu\/products_pics\/8\/a\/1\/8a1352c2d9c1348eeb2a52c3111a7379\/301478.jpg",
        "Thumbnail": "\/\/static.tme.eu\/products_pics\/8\/a\/1\/8a1352c2d9c1348eeb2a52c3111a7379\/301478_t.jpg",
        "Weight": 0.186,
        "SuppliedAmount": 0,
        "MinAmount": 10,
        "Multiples": 10,
        "ProductStatusList": [],
        "Unit": "szt",
        "OfferId": "",
        "CustomerSymbol": "",
        "ProductInformationPage": "\/\/www.tme.eu\/pl\/details\/fix-led-301a\/oprawki\/fixfasten\/",
        "Guarantee": null
      }
    ],
    "Amount": 17245,
    "PageNumber": 1,
    "CategoryList": {
      "111000": 17245,
      "112140": 9141
    }
  }
          """;

    ApiSearchResult searchResult = ApiSearchResult.fromJson(json.decode(str));

    expect(searchResult.products.length, 1);
    expect(searchResult.products.first.symbol, "FIX-LED-301A");
    expect(searchResult.page, 1);
    expect(searchResult.totalProductsFound, 17245);
    expect(searchResult.totalProductsPerCategory.length, 2);
    expect(searchResult.totalProductsPerCategory["111000"], 17245);
  });
}
