import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 150,
              floating: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Welcome Back!',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Jack Smith',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_outlined,
                              color: Color.fromARGB(255, 9, 2, 86),
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverAppBar(
              backgroundColor: Color.fromARGB(255, 9, 2, 86),
              expandedHeight: 200,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

                centerTitle: false, // <- This centers the "Wallet" title
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$8,190.00 ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Current Balance', style: TextStyle(color: Colors.white70, fontSize: 16)),
                  ],
                ),
                title: Text('Wallet', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),

            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 170,
              toolbarHeight: 170,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quick Actions',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildQuickActionItem('Send', Icons.send),
                        _buildQuickActionItem('Receive', Icons.receipt),
                        _buildQuickActionItem('Top Up', Icons.add),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return _buildTransactionItem(
                  'Transaction ${index + 1}',
                  '${index.isEven ? '+' : '-'}\$${(index + 1) * 20}',
                  'Details of transaction ${index + 1}', // fixed here
                  index.isEven,
                );
              }, childCount: 20),
            ),
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lightbulb_outline, color: Color.fromARGB(255, 9, 2, 86), size: 64),
                  SizedBox(height: 16),
                  Text(
                    'Explore New Features',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Stay tuned for exciting updates and \nimprovements',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 9, 2, 86),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    child: Text('Learn More', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionItem(String title, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 9, 2, 86).withOpacity(0.1),
          child: Icon(icon, color: Color.fromARGB(255, 9, 2, 86), size: 30),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(color: Colors.black87, fontSize: 14)),
      ],
    );
  }

  Widget _buildTransactionItem(String title, String amount, String substitle, bool isPositive) {
    print(
      'Transaction Item: $title, Amount: $amount, Subtitle: $substitle, isPositive: $isPositive',
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 9, 2, 86).withOpacity(0.1),
            child: Icon(
              isPositive ? Icons.arrow_upward : Icons.arrow_downward,
              color: isPositive ? Colors.green : Colors.red,
              size: 30,
            ),
          ),
          title: Text(title, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
          subtitle: Text(substitle),
          trailing: Text(
            amount,
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.red,

              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
