import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Facilites extends StatefulWidget {
  const Facilites({super.key});

  @override
  State<Facilites> createState() => _FacilitesState();
}

List facImages = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfDbVuV_mlL7tVSxD3z68gowTKIYIs-hEKum8ffheR45d_rklW3DiH4-es5TCQ2DK69Qg&usqp=CAU",
  "https://dfbok4z7i5u6t.cloudfront.net/thumbnail_500_320/property/2022/09/10/631c872412382.jpg",
  "https://media.licdn.com/dms/image/D4D12AQF1mZtkxV4NIA/article-cover_image-shrink_720_1280/0/1688717503189?e=2147483647&v=beta&t=pqgAXLCxW4bD5x1enHeqWyFloNqYWANoyPE_EwWmDNY",
  "https://www.oyeexpress.com/in/blogimg/image1.jpg",
  "https://hubble.imgix.net/listings/uploads/spaces/5160/Coworking_Fitz1.jpg?auto=format%2Ccompress&ar=4%3A3&fit=crop&q=30&w=3840",
];

class _FacilitesState extends State<Facilites> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      child:
      ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: facImages.length,
          itemBuilder: (context, index) {
            return facilitiesItem(index: index);
            // WorkSpaceAvailable();
          }),
    );
  }
  Widget facilitiesItem({required int index}) {
    return Padding(
      padding: EdgeInsets.only(left: 10.sp,top: 10.sp),
      child:
      Container(
        height: 70.sp,
        width: 50.sp,
        child: Image.network(facImages[index]),
      ),
    );
  }
}
