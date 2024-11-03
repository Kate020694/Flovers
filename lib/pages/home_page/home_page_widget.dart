import '/backend/supabase/supabase.dart';
import '/components/product_component/product_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_1.png',
                  width: 339.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0.0, 0.0),
                ),
              ),
            ),
            actions: const [],
            centerTitle: false,
            toolbarHeight: 60.0,
            elevation: 0.5,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
                  child: Text(
                    'Букеты-бестселлеры',
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: FutureBuilder<List<ProductRow>>(
                    future: ProductTable().querySingleRow(
                      queryFn: (q) => q.eq(
                        'best',
                        true,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<ProductRow> columnProductRowList = snapshot.data!;

                      final columnProductRow = columnProductRowList.isNotEmpty
                          ? columnProductRowList.first
                          : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'productitem',
                                queryParameters: {
                                  'id': serializeParam(
                                    columnProductRow.id,
                                    ParamType.int,
                                  ),
                                  'img': serializeParam(
                                    columnProductRow.img,
                                    ParamType.String,
                                  ),
                                  'name': serializeParam(
                                    columnProductRow.name,
                                    ParamType.String,
                                  ),
                                  'desc': serializeParam(
                                    columnProductRow.desk,
                                    ParamType.String,
                                  ),
                                  'compound': serializeParam(
                                    columnProductRow.compound,
                                    ParamType.String,
                                  ),
                                  'price': serializeParam(
                                    columnProductRow.price,
                                    ParamType.int,
                                  ),
                                  'imgList': serializeParam(
                                    columnProductRow.imgList,
                                    ParamType.String,
                                    isList: true,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: wrapWithModel(
                              model: _model.productComponentModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: ProductComponentWidget(
                                best: false,
                                id: columnProductRow!.id,
                                img: columnProductRow.img!,
                                price: columnProductRow.price!,
                                name: columnProductRow.name!,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                FutureBuilder<List<ProductRow>>(
                  future: ProductTable().queryRows(
                    queryFn: (q) => q.eq(
                      'best',
                      false,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ProductRow> staggeredViewProductRowList =
                        snapshot.data!;

                    return MasonryGridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 20.0,
                      itemCount: staggeredViewProductRowList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, staggeredViewIndex) {
                        final staggeredViewProductRow =
                            staggeredViewProductRowList[staggeredViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'productitem',
                              queryParameters: {
                                'id': serializeParam(
                                  staggeredViewProductRow.id,
                                  ParamType.int,
                                ),
                                'img': serializeParam(
                                  staggeredViewProductRow.img,
                                  ParamType.String,
                                ),
                                'name': serializeParam(
                                  staggeredViewProductRow.name,
                                  ParamType.String,
                                ),
                                'desc': serializeParam(
                                  staggeredViewProductRow.desk,
                                  ParamType.String,
                                ),
                                'compound': serializeParam(
                                  staggeredViewProductRow.compound,
                                  ParamType.String,
                                ),
                                'price': serializeParam(
                                  staggeredViewProductRow.price,
                                  ParamType.int,
                                ),
                                'imgList': serializeParam(
                                  staggeredViewProductRow.imgList,
                                  ParamType.String,
                                  isList: true,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ProductComponentWidget(
                            key: Key(
                                'Keywu7_${staggeredViewIndex}_of_${staggeredViewProductRowList.length}'),
                            best: false,
                            id: staggeredViewProductRow.id,
                            img: staggeredViewProductRow.img!,
                            price: staggeredViewProductRow.price!,
                            name: staggeredViewProductRow.name!,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
