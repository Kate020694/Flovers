import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_component_model.dart';
export 'product_component_model.dart';

class ProductComponentWidget extends StatefulWidget {
  const ProductComponentWidget({
    super.key,
    this.best,
    required this.id,
    required this.img,
    required this.price,
    required this.name,
  });

  final bool? best;
  final int? id;
  final String? img;
  final int? price;
  final String? name;

  @override
  State<ProductComponentWidget> createState() => _ProductComponentWidgetState();
}

class _ProductComponentWidgetState extends State<ProductComponentWidget> {
  late ProductComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.network(
                  widget.img!,
                  width: double.infinity,
                  height: widget.best! ? 270.0 : 144.0,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                  child: ToggleIcon(
                    onPressed: () async {
                      safeSetState(
                        () => FFAppState().favorites.contains(widget.id)
                            ? FFAppState().removeFromFavorites(widget.id!)
                            : FFAppState().addToFavorites(widget.id!),
                      );
                    },
                    value: FFAppState().favorites.contains(widget.id),
                    onIcon: Icon(
                      Icons.favorite,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 26.0,
                    ),
                    offIcon: Icon(
                      Icons.favorite_border,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 26.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 6.0),
            child: Text(
              '${valueOrDefault<String>(
                widget.price?.toString(),
                '-',
              )} руб',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Roboto',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget.name,
              '-',
            ),
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
