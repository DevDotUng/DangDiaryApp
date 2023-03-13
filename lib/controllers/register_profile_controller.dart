import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegisterProfileController extends GetxController {
  static RegisterProfileController get to => Get.find();
  RxInt pageIndex = 0.obs;
  final ImagePicker _picker = ImagePicker();
  final profileImage = Rxn<XFile>();
  List<String> genderList = ['암컷', '수컷'];
  RxString breed = ''.obs;
  RxString searchText = ''.obs;
  RxList autoCompleteWord = [].obs;
  RxString birth = '2022.01.31'.obs;
  String tempBirth = '2022.01.31';
  RxInt age = 0.obs;
  RxString gender = '암컷'.obs;
  String tempGender = '암컷';
  RxBool isBlankDogName = true.obs;
  RxBool isBlankUserName = true.obs;
  late TextEditingController dogNameTextEditingController;
  late TextEditingController userNameTextEditingController;
  late ScrollController scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    dogNameTextEditingController = TextEditingController();
    userNameTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    dogNameTextEditingController.dispose();
    userNameTextEditingController.dispose();
    super.dispose();
  }

  void changeDogNameBlank(String text) {
    if (text.isEmpty) {
      isBlankDogName(true);
    } else {
      isBlankDogName(false);
    }
  }

  void changeUserNameBlank(String text) {
    if (text.isEmpty) {
      isBlankUserName(true);
    } else {
      isBlankUserName(false);
    }
  }

  void changeAge(DateTime value) {
    DateTime currentDate = DateTime.now();

    int yearNow = currentDate.year;
    int monthNow = currentDate.month;
    int dayOfMonthNow = currentDate.day;

    int yearBirth = value.year;
    int monthBirth = value.month;
    int dayOfMonthBirth = value.day;

    int tempAge = yearNow - yearBirth;

    if (monthNow <= monthBirth) {
      if (monthNow == monthBirth) {
        if (dayOfMonthNow < dayOfMonthBirth) {
          tempAge--;
        }
      } else {
        tempAge--;
      }
    }

    age(tempAge);
  }

  void nextPage() {
    if (pageIndex.value == 4) {
      Get.offAndToNamed('/app');
    } else {
      pageIndex(pageIndex.value + 1);
    }
  }

  void previousPage() {
    if (pageIndex.value != 0) {
      pageIndex(pageIndex.value - 1);
    }
  }

  Future<void> pickImage(BuildContext context) async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    profileImage(image);
  }

  void changeTextListener(String text) {
    searchText(text);
    autoCompleteWord.clear();
    for (String word in breedList) {
      if (word.contains(text)) {
        autoCompleteWord.add(word);
      }
    }
  }

  void pickBreed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      isScrollControlled: true,
      builder: (BuildContext buildContext) {
        return Container(
          height: Get.height * 0.8,
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CustomText(
                    text: '어떤 견종인가요?',
                    color: StaticColor.font_main,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    height: (32 / 18),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  onChanged: (text) {
                    changeTextListener(text);
                  },
                  cursorColor: Colors.black,
                  cursorWidth: 1.w,
                  cursorHeight: 20.h,
                  textInputAction: TextInputAction.search,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 14).h,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 12.h),
                    border: InputBorder.none,
                    hintText: '견종을 입력하세요',
                    hintStyle: TextStyle(
                      color: Color(0xffA6A6A6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (24 / 14).h,
                    ),
                    prefixIconConstraints: BoxConstraints.tight(
                      Size(32.w, 24.h),
                    ),
                    prefixIcon: StaticIcon(
                      IconsPath.search,
                      size: 24.r,
                      color: StaticColor.link,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: autoCompleteWord.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              breed(breedList[index]);
                            },
                            child: Obx(
                              () => breed.value == breedList[index]
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w),
                                            child: CustomText(
                                              text: autoCompleteWord[index],
                                              color: StaticColor.main,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              height: (24 / 14),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.w),
                                          child: StaticIcon(
                                            IconsPath.check,
                                            size: 24.r,
                                            color: StaticColor.main,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      width: double.infinity,
                                      child: CustomText(
                                        text: autoCompleteWord[index],
                                        color: StaticColor.font_main,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        height: (24 / 14),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: double.infinity,
                            height: 1.h,
                            color: Color(0xffF5F5F5),
                          ),
                          SizedBox(height: 8.h),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {
                  if (!RegisterProfileController.to.isBlankDogName.value) {
                    RegisterProfileController.to.nextPage();
                  }
                },
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: RegisterProfileController.to.isBlankDogName.value
                        ? Color(0xffD2D2D2)
                        : StaticColor.main,
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  child: Center(
                    child: CustomText(
                      text: '다음',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Future<void> showCupertinoBirthPicker(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => SizedBox(
        height: 260.h,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 44.h,
              color: Color(0xffF0F1F4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      birth(tempBirth);
                    },
                    child: CustomText(
                      text: '완료',
                      color: Color(0xff387CF6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: (20 / 16),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 216.h,
              padding: const EdgeInsets.only(top: 6.0),
              color: CupertinoColors.white,
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 22,
                ),
                child: SafeArea(
                  top: false,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime:
                        DateFormat('yyyy.MM.dd').parse(birth.value),
                    onDateTimeChanged: (DateTime value) {
                      if (value != null) {
                        String formattedDate =
                            DateFormat('yyyy.MM.dd').format(value);
                        tempBirth = formattedDate;
                        changeAge(value);
                      } else {}
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showCupertinoGenderPicker(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => SizedBox(
        height: 260.h,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 44.h,
              color: Color(0xffF0F1F4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      gender(tempGender);
                    },
                    child: CustomText(
                      text: '완료',
                      color: Color(0xff387CF6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: (20 / 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 216.h,
              padding: const EdgeInsets.only(top: 6.0),
              color: CupertinoColors.white,
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 22,
                ),
                child: SafeArea(
                  top: false,
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 40,
                    children: genderList
                        .map((item) => Center(
                              child: Text(
                                item,
                                style: TextStyle(fontSize: 22),
                              ),
                            ))
                        .toList(),
                    onSelectedItemChanged: (index) {
                      tempGender = genderList[index];
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> breedList = [
    '고든 세터',
    '골든 리트리버',
    '골든두들',
    '그레이트 데인',
    '그레이트 스위스 마운틴 도그',
    '그레이트 피레니즈',
    '그레이하운드',
    '그린란드견',
    '글렌 오브 이말 테리어',
    '기슈견',
    '꼬똥 드 툴레아',
    '나폴리탄 마스티프',
    '노르웨이 엘크 하운드',
    '노르웨지안 부훈트',
    '노리치 테리어',
    '노바 스코셔 덕 톨링 레트리버',
    '노퍽 테리어',
    '뉴펀들랜드',
    '닥스훈트',
    '달마시안',
    '댄디 딘몬트 테리어',
    '도고 까나리오',
    '도고 아르헨티노',
    '도그 드 보르도',
    '도베르만 핀셔',
    '도사견',
    '동경이',
    '라고토 로마뇰로',
    '라사압소',
    '라페이로 도 알렌테조',
    '라포니안 허더',
    '래브라도 리트리버',
    '레온베르거',
    '레이크랜드 테리어',
    '로디지아 리지백',
    '로첸',
    '로트와일러',
    '마스티프',
    '맨체스터 테리어',
    '말티즈',
    '미니어처 불 테리어',
    '미니어처 슈나우저',
    '미니어처 핀셔',
    '믹스견',
    '말티푸',
    '바센지',
    '바셋 하운드',
    '버니즈 마운틴 도그',
    '베들링턴 테리어',
    '발바리',
    '벨기에 말리노이즈',
    '벨기에 테뷰런',
    '벨지안 그리펀',
    '벨지언 쉽독 (벨지언 셰퍼드)',
    '보더콜리',
    '보더 테리어',
    '보르도 마스티프',
    '보르조이',
    '보비에 드 플랜더스',
    '보스롱',
    '보스턴 테리어',
    '복서',
    '볼로네즈',
    '불개',
    '불도그',
    '불리 쿠타',
    '불 마스티프',
    '불 테리어',
    '브뤼셀 그리펀',
    '브리어드',
    '브리타니',
    '블랙 러시안 테리어',
    '블랙 앤드 탄 쿤하운드',
    '블러드 하운드',
    '비글',
    '비숑 프리제',
    '비어디드 콜리',
    '비즐라',
    '빠삐용',
    '사모예드',
    '사플라니낙',
    '살루키',
    '삽살개',
    '샤페이',
    '서식스 스패니얼',
    '세인트 버나드',
    '셰틀랜드 쉽독',
    '소프트 코티드 휘튼 테리어',
    '솔로이츠 쿠인틀레',
    '스무드 폭스 테리어',
    '스웨디쉬 발훈트',
    '스카이 테리어',
    '스코티시 디어하운드',
    '스코티시 테리어',
    '스키퍼키',
    '스태퍼드셔 불 테리어',
    '스탠더드 슈나우저',
    '스패니쉬 그레이 하운드',
    '스패니쉬 마스티프',
    '스피노네 이탈리아노',
    '스피츠',
    '시고르자브종',
    '시바 이누',
    '시베리언 허스키',
    '시추',
    '시코쿠견',
    '실리엄 테리어',
    '실키 테리어',
    '아나톨리아 셰퍼드',
    '아메리칸 불도그',
    '아메리칸 불리',
    '아메리칸 스태퍼드셔 테리어',
    '아메리칸 아키다',
    '아메리칸 에스키모 도그',
    '아메리칸 워터 스패니얼',
    '아메리칸 코커 스패니얼',
    '아메리칸 폭스하운드',
    '아이디',
    '아이리시 소프트코티드 휘튼 테리어',
    '아이리시 레드 앤드 화이트 세터',
    '아이리시 세터',
    '아이리시 울프 하운드',
    '아이리시 워터 스패니얼',
    '아이리시 테리어',
    '아키타',
    '아펜핀셔',
    '아프간 하운드',
    '알래스칸 맬러뮤트',
    '알래스칸 클리카이',
    '에스트렐라 마운틴 독',
    '에어데일 테리어',
    '오브차카',
    '오스트레일리안 실키 테리어',
    '오스트레일리안 켈피',
    '오스트레일리언 셰퍼드',
    '오스트레일리언 캐틀 도그',
    '오스트레일리언 테리어',
    '오터 하운드',
    '올드 잉글리시 쉽독',
    '와이머라너',
    '와이어 폭스 테리어',
    '와이어헤어드 포인팅 그리펀',
    '야쿠탄 라이카',
    '요크셔 테리어',
    '웨스트 하이랜드 화이트테리어',
    '웰시 스프링어 스패니얼',
    '웰시 코기',
    '웰시 테리어',
    '이비전 하운드',
    '이탤리언 그레이하운드',
    '잉글리시 세터',
    '잉글리시 스프링어 스패니얼',
    '잉글리시 코커 스패니얼',
    '잉글리시 토이 스패니얼',
    '잉글리시 폭스하운드',
    '자이언트 슈나우저',
    '재패니즈 친',
    '재패니즈 스피츠',
    '잭 러셀 테리어',
    '저먼 셰퍼드',
    '저먼 쇼트헤어드 포인터',
    '저먼 와이어헤어드 포인터',
    '저먼 핀셔',
    '저먼 헌팅 테리어',
    '제주개',
    '진돗개',
    '차우차우',
    '차이니즈 샤페이',
    '차이니즈 크레스티드',
    '체서피크 베이 레트리버',
    '체코슬로바키아 늑대개',
    '치와와',
    '카네 코르소',
    '카디건 웰시 코기',
    '카발리에 킹 찰스 스파니엘',
    '캉갈',
    '컬리코티드 레트리버',
    '케리 블루 테리어',
    '케언 테리어',
    '케이넌 도그',
    '케이스혼트',
    '코리안 마스티프',
    '코몬도르',
    '코커 스패니얼',
    '콜리',
    '쿠바스',
    '쿠이커혼제',
    '클럼버 스패니얼',
    '토이 폭스 테리어',
    '티베탄 마스티프',
    '티베탄 스패니얼',
    '티베탄 테리어',
    '파라오 하운드',
    '파슨 러셀 테리어',
    '파피용',
    '패터데일 테리어',
    '퍼그',
    '페키니즈',
    '펨브록 웰시 코기',
    '포르투기즈 워터 도그',
    '포메라니안',
    '포인터',
    '폭스 테리어',
    '폴리시 롤런드 시프도그',
    '폼피츠',
    '푸들',
    '푸미',
    '풀리',
    '풍산개',
    '프렌치 불도그',
    '프티 바세 그리퐁 방댕',
    '플랫코티드 레트리버',
    '플롯 하운드',
    '피니시 스피츠',
    '피레니안 마스티프',
    '피레니안 쉽독',
    '피레니언 셰퍼드',
    '필드 스패니얼',
    '핏 불 테리어',
    '해리어',
    '하바니즈',
    '홋카이도 이누',
    '휘핏',
    '골든두들',
    '골든두들',
    '골든두들',
    '골든두들',
  ];
}
