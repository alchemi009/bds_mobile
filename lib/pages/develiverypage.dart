import 'package:bds_mobile/models/deliverymodel.dart';
import 'package:bds_mobile/services/api_manager.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  Future<DeliveryList> _deliveryList;

  @override
  void initState() {
    _deliveryList = API_Manager().getDeliveries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Delivery List')),
      ),
      body: Container(
        child: FutureBuilder<DeliveryList>(
          future: _deliveryList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.deliveries.length,
                  itemBuilder: (context, index) {
                    var deliveries = snapshot.data.deliveries[index];
                    return Center(
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.delivery_dining),
                          title: Text(deliveries.subscriberFname +
                              " " +
                              deliveries.subscriberLname),
                          subtitle: Text(deliveries.subscriberAddress),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
