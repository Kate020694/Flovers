import '/backend/supabase/supabase.dart';
import '/components/favoriteitem/favoriteitem_widget.dart';
import '/components/not_found/not_found_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_page_model.dart';
export 'favorites_page_model.dart';

class FavoritesPageWidget extends StatefulWidget {
  const FavoritesPageWidget({super.key});

  @override
  State<FavoritesPageWidget> createState() => _FavoritesPageWidgetState();
}

class _FavoritesPageWidgetState extends State<FavoritesPageWidget> {
  late FavoritesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritesPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 40.0,
              ),
            ),
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
            actions: [
              Container(
                width: 56.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ],
            centerTitle: false,
            toolbarHeight: 60.0,
            elevation: 0.5,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (FFAppState().favorites.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Избранное',
                            style: FlutterFlowTheme.of(context)
                                .displayLarge
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final favorites = FFAppState().favorites.toList();
                            if (favorites.isEmpty) {
                              return const NotFoundWidget();
                            }

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(favorites.length,
                                  (favoritesIndex) {
                                final favoritesItem = favorites[favoritesIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: FutureBuilder<List<ProductRow>>(
                                    future: ProductTable().querySingleRow(
                                      queryFn: (q) => q.eq(
                                        'id',
                                        favoritesItem,
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ProductRow>
                                          favoriteitemProductRowList =
                                          snapshot.data!;

                                      final favoriteitemProductRow =
                                          favoriteitemProductRowList.isNotEmpty
                                              ? favoriteitemProductRowList.first
                                              : null;

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
                                                favoriteitemProductRow.id,
                                                ParamType.int,
                                              ),
                                              'img': serializeParam(
                                                favoriteitemProductRow.img,
                                                ParamType.String,
                                              ),
                                              'name': serializeParam(
                                                favoriteitemProductRow.name,
                                                ParamType.String,
                                              ),
                                              'desc': serializeParam(
                                                favoriteitemProductRow.desk,
                                                ParamType.String,
                                              ),
                                              'compound': serializeParam(
                                                favoriteitemProductRow
                                                    .compound,
                                                ParamType.String,
                                              ),
                                              'price': serializeParam(
                                                favoriteitemProductRow.price,
                                                ParamType.int,
                                              ),
                                              'imgList': serializeParam(
                                                favoriteitemProductRow.imgList,
                                                ParamType.String,
                                                isList: true,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: FavoriteitemWidget(
                                          key: Key(
                                              'Keylya_${favoritesIndex}_of_${favorites.length}'),
                                          id: favoriteitemProductRow!.id,
                                          img: favoriteitemProductRow.img!,
                                          name: favoriteitemProductRow.name!,
                                          price: favoriteitemProductRow.price!,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Icon(
                          Icons.favorite_border_sharp,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 48.0,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: Text(
                            'Избранное пусто',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: 'Вернуться',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
