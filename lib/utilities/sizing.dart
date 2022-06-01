import 'package:flutter/widgets.dart';


class SizeReference {
  ///The current context on the widget tree;
  final BuildContext context;

  ///This class creates an abstraction of the MediaQuery class
  ///creates simple access to the `height` and `width` params;
  SizeReference(this.context);

  ///Returns the vertical extent of this size.
  get height {
    return MediaQuery.of(context).size.height;
  }

  ///Returns the vertical extent of this size.
  get width {
    return MediaQuery.of(context).size.width;
  }
}
