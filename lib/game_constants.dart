import 'package:flutter/material.dart';
import 'dart:math';

class GameConstants {
  static const int baseTimePerLevel = 60; // seconds
  static const int timeBonusPerCorrect = 5; // seconds
  static const int timePenaltyPerWrong = 3; // seconds
  static const int scorePerCorrect = 10;
  static const int scorePenalty = 5;

  static const Map<String, List<Category>> categoriesByLanguage = {
    'en': [
      Category('Shapes', Colors.orange),
      Category('Colors', Colors.red),
      Category('Numbers', Colors.blue),
      Category('Letters', Colors.purple),
      Category('Animals', Colors.green),
      Category('Food', Colors.pink),
      Category('Transport', Colors.teal),
      Category('Toys', Colors.amber),
    ],
    'zh': [
      Category('形状', Colors.orange),
      Category('颜色', Colors.red),
      Category('数字', Colors.blue),
      Category('字母', Colors.purple),
      Category('动物', Colors.green),
      Category('食物', Colors.pink),
      Category('交通', Colors.teal),
      Category('玩具', Colors.amber),
    ],
    'vi': [
      Category('Hình dạng', Colors.orange),
      Category('Màu sắc', Colors.red),
      Category('Số đếm', Colors.blue),
      Category('Chữ cái', Colors.purple),
      Category('Động vật', Colors.green),
      Category('Thức ăn', Colors.pink),
      Category('Phương tiện', Colors.teal),
      Category('Đồ chơi', Colors.amber),
    ],
    'ko': [
      Category('모양', Colors.orange),
      Category('색상', Colors.red),
      Category('숫자', Colors.blue),
      Category('글자', Colors.purple),
      Category('동물', Colors.green),
      Category('음식', Colors.pink),
      Category('교통', Colors.teal),
      Category('장난감', Colors.amber),
    ],
  };

  static const Map<String, Map<String, List<String>>> itemsByCategory = {
    'en': {
      'Shapes': [
        'Circle',
        'Square',
        'Triangle',
        'Rectangle',
        'Star',
        'Heart',
        'Diamond',
        'Oval'
      ],
      'Colors': [
        'Red',
        'Blue',
        'Green',
        'Yellow',
        'Purple',
        'Orange',
        'Pink',
        'Brown'
      ],
      'Numbers': [
        'One',
        'Two',
        'Three',
        'Four',
        'Five',
        'Six',
        'Seven',
        'Eight'
      ],
      'Letters': ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'],
      'Animals': [
        'Dog',
        'Cat',
        'Bird',
        'Fish',
        'Lion',
        'Elephant',
        'Giraffe',
        'Penguin'
      ],
      'Food': [
        'Apple',
        'Banana',
        'Bread',
        'Milk',
        'Egg',
        'Rice',
        'Pizza',
        'Ice Cream'
      ],
      'Transport': [
        'Car',
        'Bus',
        'Train',
        'Bike',
        'Plane',
        'Boat',
        'Truck',
        'Helicopter'
      ],
      'Toys': [
        'Ball',
        'Doll',
        'Car',
        'Teddy',
        'Blocks',
        'Puzzle',
        'Robot',
        'Kite'
      ],
    },
    'zh': {
      '形状': ['圆形', '方形', '三角形', '长方形', '星形', '心形', '菱形', '椭圆形'],
      '颜色': ['红色', '蓝色', '绿色', '黄色', '紫色', '橙色', '粉色', '棕色'],
      '数字': ['一', '二', '三', '四', '五', '六', '七', '八'],
      '字母': ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'],
      '动物': ['狗', '猫', '鸟', '鱼', '狮子', '大象', '长颈鹿', '企鹅'],
      '食物': ['苹果', '香蕉', '面包', '牛奶', '鸡蛋', '米饭', '披萨', '冰淇淋'],
      '交通': ['汽车', '公交车', '火车', '自行车', '飞机', '船', '卡车', '直升机'],
      '玩具': ['球', '娃娃', '玩具车', '泰迪熊', '积木', '拼图', '机器人', '风筝'],
    },
    'vi': {
      'Hình dạng': [
        'Hình tròn',
        'Hình vuông',
        'Hình tam giác',
        'Hình chữ nhật',
        'Ngôi sao',
        'Trái tim',
        'Hình thoi',
        'Hình bầu dục'
      ],
      'Màu sắc': [
        'Đỏ',
        'Xanh dương',
        'Xanh lá',
        'Vàng',
        'Tím',
        'Cam',
        'Hồng',
        'Nâu'
      ],
      'Số đếm': ['Một', 'Hai', 'Ba', 'Bốn', 'Năm', 'Sáu', 'Bảy', 'Tám'],
      'Chữ cái': ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'],
      'Động vật': [
        'Chó',
        'Mèo',
        'Chim',
        'Cá',
        'Sư tử',
        'Voi',
        'Hươu cao cổ',
        'Chim cánh cụt'
      ],
      'Thức ăn': [
        'Táo',
        'Chuối',
        'Bánh mì',
        'Sữa',
        'Trứng',
        'Cơm',
        'Pizza',
        'Kem'
      ],
      'Phương tiện': [
        'Xe hơi',
        'Xe buýt',
        'Tàu hỏa',
        'Xe đạp',
        'Máy bay',
        'Thuyền',
        'Xe tải',
        'Trực thăng'
      ],
      'Đồ chơi': [
        'Bóng',
        'Búp bê',
        'Xe đồ chơi',
        'Gấu bông',
        'Khối xếp hình',
        'Xếp hình',
        'Rô bốt',
        'Diều'
      ],
    },
    'ko': {
      '모양': ['원', '사각형', '삼각형', '직사각형', '별', '하트', '다이아몬드', '타원'],
      '색상': ['빨간색', '파란색', '초록색', '노란색', '보라색', '주황색', '분홍색', '갈색'],
      '숫자': ['하나', '둘', '셋', '넷', '다섯', '여섯', '일곱', '여덟'],
      '글자': ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'],
      '동물': ['개', '고양이', '새', '물고기', '사자', '코끼리', '기린', '펭귄'],
      '음식': ['사과', '바나나', '빵', '우유', '달걀', '쌀', '피자', '아이스크림'],
      '교통': ['자동차', '버스', '기차', '자전거', '비행기', '배', '트럭', '헬리콥터'],
      '장난감': ['공', '인형', '장난감 자동차', '테디베어', '블록', '퍼즐', '로봇', '연'],
    },
  };

  static List<Item> getItemsForLevel(int level, String language) {
    final items = <Item>[];
    final categories = categoriesByLanguage[language]!;
    final numCategories = min(3 + (level ~/ 2), categories.length);
    final selectedCategories = categories.take(numCategories).toList();

    for (var category in selectedCategories) {
      final categoryItems = itemsByCategory[language]![category.name]!;
      final numItems = min(2 + (level ~/ 3), categoryItems.length);
      final selectedItems = categoryItems.take(numItems).toList();

      for (var itemName in selectedItems) {
        items.add(Item(itemName, category.name));
      }
    }

    return items;
  }
}

class Item {
  final String name;
  final String category;

  Item(this.name, this.category);
}

class Category {
  final String name;
  final Color color;

  const Category(this.name, this.color);
}
