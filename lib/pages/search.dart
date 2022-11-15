import 'package:dangdiarysample/controllers/search_controller.dart';
import 'package:dangdiarysample/skeletons/search_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Obx(
      () => SearchController.to.isLoading.value
          ? SearchSkeleton()
          : _searchWidget(context),
    );
  }

  Widget _searchWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Container(),
          centerTitle: true,
          title: Text(
            '둘러보기',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Focus(
                        onFocusChange: (isFocus) {
                          if (isFocus == true) {
                            SearchController.to.changeFocus(isFocus);
                          }
                        },
                        child: TextField(
                          cursorColor: Color(0xff202020),
                          cursorWidth: 1,
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xff0A0A0A),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: '어떤 이야기를 찾아볼까요?',
                            hintStyle: TextStyle(
                              color: Color(0xffA6A6A6),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.only(left: 8.0),
                            suffixIcon: Icon(
                              Icons.search,
                              size: 16,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 0.0,
                                style: BorderStyle.none,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 0.0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => SearchController.to.isFocus.value
                        ? Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: GestureDetector(
                              onTap: () {
                                SearchController.to.changeFocus(false);
                                FocusScope.of(context).unfocus();
                              },
                              child: Container(
                                width: 16,
                                height: 16,
                                child: Center(
                                  child: Icon(Icons.clear, size: 15),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Obx(
                () => SearchController.to.isFocus.value
                    ? _searchHistory()
                    : _posts(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _posts() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 8,
          mainAxisExtent: 221,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/post');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/dog.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _searchHistory() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '이전 검색 기록',
              style: TextStyle(
                color: Color(0xffA6A6A6),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '미션 산책하며 물먹기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '미션 산책하며 물먹기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 13),
                          Icon(Icons.clear, size: 8),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
