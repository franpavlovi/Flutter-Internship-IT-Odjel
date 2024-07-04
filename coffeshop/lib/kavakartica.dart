import 'package:coffeshop/kava.dart';
import 'package:coffeshop/narucikavu.dart';
import 'package:flutter/material.dart';

class Kavakartica extends StatefulWidget {
  const Kavakartica({super.key, required this.kava});

  final Kava kava;

  @override
  State<Kavakartica> createState() => _KavakarticaState();
}

class _KavakarticaState extends State<Kavakartica> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.brown,
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            widget.kava.ime,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('${widget.kava.cijena} EUR', style: const TextStyle(color: Colors.white)),
          IconButton(
              onPressed: () {
                setState(() {
                  widget.kava.fav = !widget.kava.fav;
                });
              },
              icon: Icon(widget.kava.fav ? Icons.heart_broken : Icons.heart_broken_outlined)),
          SizedBox(
            width: 100,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Narucikavu(kava: widget.kava)));
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.0, color: Colors.white),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'NARUČI',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
