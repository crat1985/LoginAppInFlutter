import 'package:flutter/material.dart';

class Therm extends StatefulWidget {
  final Function(int) onChangedStep;
  final String terms;

  const Therm({super.key, required this.terms, required this.onChangedStep});

  @override
  State<StatefulWidget> createState() => ThermState();
}

class ThermState extends State<Therm> {
  bool _thermsRead = false;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      if (_scrollController!.offset >=
              _scrollController!.position.maxScrollExtent &&
          !_scrollController!.position.outOfRange) {
        setState(() => _thermsRead = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          titleSpacing: 0,
          title: const Text("Termes et conditions"),
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () => widget.onChangedStep(0),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.terms,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  disabledBackgroundColor: Colors.grey,
                  disabledForegroundColor: Colors.white,
                ),
                onPressed: !_thermsRead ? null : () => widget.onChangedStep(2),
                child: Text(
                  "accepter & continue".toUpperCase(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
