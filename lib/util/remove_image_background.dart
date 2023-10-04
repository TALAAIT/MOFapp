import 'package:image/image.dart' as img;

///This is function to make background of an image background transparent, by passing [img.Image] object,
///and [threshold] to determine which pixek should be transparent.

img.Image makeTransparentBackground(img.Image image, int threshold) {
  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width; x++) {
      img.Pixel pixelValue = image.getPixel(x, y);
      int red = pixelValue.r as int;
      int green = pixelValue.g as int;
      int blue = pixelValue.b as int;
      if(blue > threshold && red > threshold && green > threshold) {
        image.setPixel(x, y,image.getColor(0, 0, 0, 0));
      }
    }
  }
  return image;
}
