import 'package:flutter/material.dart';

class LanguageConstants {
  static const Map<String, Map<String, String>> translations = {
    'en': {
      'appTitle': 'Good Sort Game',
      'startGame': 'Start Game',
      'level': 'Level',
      'score': 'Score',
      'time': 'Time',
      'gameOver': 'Game Over!',
      'levelComplete': 'Level Complete!',
      'playAgain': 'Play Again',
      'nextLevel': 'Next Level',
      'finalScore': 'Final Score',
      'levelReached': 'Level Reached',
      'timeLeft': 'Time Left',
      'seconds': 'seconds',
      'selectLanguage': 'Select Your Language',
      'chooseLanguage': 'Choose Language',
      'welcome': 'Welcome to Good Sort Game!',
      'subtitle': 'Sort items into their correct categories!',
    },
    'zh': {
      'appTitle': '好分类游戏',
      'startGame': '开始游戏',
      'level': '关卡',
      'score': '得分',
      'time': '时间',
      'gameOver': '游戏结束！',
      'levelComplete': '关卡完成！',
      'playAgain': '再玩一次',
      'nextLevel': '下一关',
      'finalScore': '最终得分',
      'levelReached': '达到关卡',
      'timeLeft': '剩余时间',
      'seconds': '秒',
      'selectLanguage': '选择你的语言',
      'chooseLanguage': '选择语言',
      'welcome': '欢迎来到好分类游戏！',
      'subtitle': '将物品分类到正确的类别中！',
    },
    'vi': {
      'appTitle': 'Trò Chơi Phân Loại',
      'startGame': 'Bắt Đầu Chơi',
      'level': 'Cấp Độ',
      'score': 'Điểm Số',
      'time': 'Thời Gian',
      'gameOver': 'Kết Thúc!',
      'levelComplete': 'Hoàn Thành Cấp Độ!',
      'playAgain': 'Chơi Lại',
      'nextLevel': 'Cấp Độ Tiếp',
      'finalScore': 'Điểm Cuối Cùng',
      'levelReached': 'Đạt Cấp Độ',
      'timeLeft': 'Thời Gian Còn Lại',
      'seconds': 'giây',
      'selectLanguage': 'Chọn Ngôn Ngữ Của Bạn',
      'chooseLanguage': 'Chọn Ngôn Ngữ',
      'welcome': 'Chào Mừng Đến Với Trò Chơi Phân Loại!',
      'subtitle': 'Phân loại các vật phẩm vào đúng danh mục!',
    },
    'ko': {
      'appTitle': '좋은 분류 게임',
      'startGame': '게임 시작',
      'level': '레벨',
      'score': '점수',
      'time': '시간',
      'gameOver': '게임 오버!',
      'levelComplete': '레벨 완료!',
      'playAgain': '다시 플레이',
      'nextLevel': '다음 레벨',
      'finalScore': '최종 점수',
      'levelReached': '도달한 레벨',
      'timeLeft': '남은 시간',
      'seconds': '초',
      'selectLanguage': '언어 선택',
      'chooseLanguage': '언어를 선택하세요',
      'welcome': '좋은 분류 게임에 오신 것을 환영합니다!',
      'subtitle': '아이템을 올바른 카테고리로 분류하세요!',
    },
  };

  static const List<Language> supportedLanguages = [
    Language('en', 'English', Icons.flag),
    Language('zh', '中文', Icons.flag),
    Language('vi', 'Tiếng Việt', Icons.flag),
    Language('ko', '한국어', Icons.flag),
  ];
}

class Language {
  final String code;
  final String name;
  final IconData icon;

  const Language(this.code, this.name, this.icon);
}
