import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../Constant/style.dart';
import '../../../Model/brand.dart';
import '../../../Repository/local/service/db_provider.dart';

class ListPlace extends StatefulWidget {
  final Brand tempatdata;
  const ListPlace({Key? key, required this.tempatdata}) : super(key: key);

  @override
  State<ListPlace> createState() => _ListPlaceState();
}

class _ListPlaceState extends State<ListPlace> {
  bool _isFavorit = true;
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    var imageprd = NetworkImage(widget.tempatdata.linkImg);
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
        future: provider.isBookmarked(widget.tempatdata.id),
        builder: (context, snapshot) {
          var isBookmarked = snapshot.data ?? false;
          return Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                  height: 120,
                  width: 100,
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: imageprd,
                        onError: (error, stackTrace) {
                          setState(() {
                            imageprd = NetworkImage(
                                "https://www.fairpriceautoparts.com/assets/images/no-image.png");
                          });
                        },
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width - 117 - 25,
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.tempatdata.type,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.66,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.tempatdata.merk.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: kLightGray,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                if (isBookmarked) {
                                  provider.removeBookmark(widget.tempatdata.id);
                                } else {
                                  provider.addBookmark(widget.tempatdata);
                                }
                              },
                              icon: (isBookmarked)
                                  ? Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.redAccent.shade700,
                                    )
                                  : const Icon(
                                      CupertinoIcons.heart,
                                    ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format(widget.tempatdata.price),
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
