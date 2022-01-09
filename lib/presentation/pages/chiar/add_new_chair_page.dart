import 'package:chairs_factory/business_logic/cubit/chair_cubit.dart';
import 'package:chairs_factory/data/models/chiars/chair.dart';
import 'package:chairs_factory/presentation/widgets/home/app_tool_bar.dart';
import 'package:chairs_factory/presentation/widgets/home/loading.dart';
import 'package:chairs_factory/presentation/widgets/utils/button.dart';
import 'package:chairs_factory/presentation/widgets/utils/pick_image.dart';
import 'package:chairs_factory/presentation/widgets/utils/text_from_fielid.dart';
import 'package:chairs_factory/presentation/widgets/utils/text_view.dart';
import 'package:chairs_factory/utils/constants/utils.dart';
import 'package:chairs_factory/utils/constants/values.dart';
import 'package:chairs_factory/utils/themes/text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewChairPage extends StatefulWidget {
  const AddNewChairPage({Key? key}) : super(key: key);

  static const routeName = '/chiar/add';
  @override
  _AddNewChairPageState createState() => _AddNewChairPageState();
}

class _AddNewChairPageState extends State<AddNewChairPage> {
  bool _isOpend = true;
  bool _isEdit = false;
  Chair? _chair;

  final _formKey = GlobalKey<FormState>();

  String? _pathImage;
  String? _title;
  String? _desc;
  int _open = 1;

  bool _isChair = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Map<String, Chair?>? arg =
          ModalRoute.of(context)!.settings.arguments as Map<String, Chair>;

      if (arg['Chair'] != null) {
        setState(() {
          _chair = arg['Chair'];
          _isChair = _chair != null;
          _isOpend = _chair!.status == 1;
          _isEdit = _isChair;
          _open = _chair!.status;
          _title = _chair!.title;
          _desc = _chair!.description;
          _pathImage = _chair!.picture;
          _open = _chair!.status;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: BlocBuilder<ChairCubit, ChairState>(
            builder: (context, state) {
              if (state is ChiarInitial) {
                return _formView(context);
              } else if (state is ChairLoadingState) {
                return const Loading();
              } else if (state is ChairAdded) {
                return _doneView(context);
              } else if (state is ChairSelectOne) {
                return _doneView(context);
              } else if (state is ChairError) {
                return _errorView();
              } else {
                return Center(
                  child: TextView(
                    text: '',
                    style: AppStyle().textStyle4.copyWith(fontSize: 24),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _formView(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppToolBar(
              changeLang: () {
                EasyLocalization.of(context)!
                    .setLocale(Locale(isEn ? 'ar' : 'en'));
                setState(() {
                  isEn = !isEn;
                });
              },
              title:
                  _isEdit ? translate('EditChair') : translate('AddNewChair'),
              back: () => Navigator.of(context).pop(),
            ),
            const SizedBox(height: 16),
            PickImage(
              action: (file) {
                _pathImage = file!.path;
              },
              imageLink: _isChair ? _pathImage : null,
            ),
            TextFormFieldApp(
              title: translate('Title'),
              validator: (val) =>
                  (val!.isEmpty) ? 'Title cannot be blank' : null,
              onSaved: (val) {
                _title = val;
              },
              value: _isChair ? _title : null,
            ),
            TextFormFieldApp(
              title: translate('Description'),
              validator: (val) =>
                  (val!.isEmpty) ? 'Description cannot be blank' : null,
              onSaved: (val) {
                _desc = val;
              },
              value: _isChair ? _desc : null,
            ),
            const SizedBox(height: 18),
            TextView(
              text: translate('IsOpen'),
              style: AppStyle().textStyle1.copyWith(fontSize: 18),
              textAlign: TextAlign.start,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextView(
                  text: translate('Closed'),
                  style: AppStyle().textStyle1.copyWith(fontSize: 18),
                ),
                Switch.adaptive(
                  value: _isOpend,
                  onChanged: (value) {
                    setState(() {
                      _isOpend = !_isOpend;
                      _open = _isOpend ? 1 : 0;
                    });
                  },
                ),
                TextView(
                  text: translate('Open'),
                  style: AppStyle().textStyle1.copyWith(fontSize: 18),
                ),
              ],
            ),
            ButtonApp(
              title: translate('Save'),
              action: _saveChair,
              icon: const Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }

  Center _doneView(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pop();
      },
    );
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/thumbs_up.png',
            width: MediaQuery.of(context).size.width * .5,
          ),
          TextView(
            text: translate('Done'),
            style: AppStyle().textStyle4.copyWith(fontSize: 24),
          ),
        ],
      ),
    );
  }

  _saveChair() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var createDate = dateFormat.format(DateTime.now());

      if (_isEdit) {
        _chair!.title = _title ?? '';

        _chair!.picture = _pathImage ?? '';
        _chair!.description = _desc ?? '';
        _chair!.status = _open;
        BlocProvider.of<ChairCubit>(context).updateChiar(_chair!);
      } else {
        _chair = Chair(
          title: _title ?? '',
          picture: _pathImage ?? '',
          description: _desc ?? '',
          createDate: createDate,
          status: _open,
        );
        BlocProvider.of<ChairCubit>(context).insertChiar(_chair!);
      }
    }
  }

  Widget _errorView() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/icons/error.png'),
          TextView(
            text: translate('Error'),
            style: AppStyle().textStyle4.copyWith(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
