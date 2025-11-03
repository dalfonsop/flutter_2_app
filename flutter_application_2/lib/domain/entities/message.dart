enum FromWho{mine, hers}

class Message{
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime time;
  final bool isRead;

  Message({
    required this.text, this.imageUrl, required this.fromWho,required this.time,required this.isRead
    });

  

}