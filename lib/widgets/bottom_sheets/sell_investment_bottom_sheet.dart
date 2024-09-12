import 'package:bankopol/models/investment.dart';
import 'package:bankopol/provider/game/game_provider.dart';
import 'package:bankopol/widgets/investments/investment_card.dart';
import 'package:flutter/material.dart';

class SellInvestmentBottomSheet extends StatelessWidget {
  final GameProvider gameProvider;

  const SellInvestmentBottomSheet({
    required this.gameProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return ListenableBuilder(
          listenable: gameProvider,
          builder: (context, __) {
            return SizedBox(
              height: 500,
              child: DraggableScrollableSheet(
                initialChildSize: 1,
                minChildSize: 0.2,
                maxChildSize: 1,
                builder: (context, _) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: Text(
                            'Swipa för att sälja investering',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            for (final investment
                                in gameProvider.currentPlayer?.investments ??
                                    <Investment>{})
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: Dismissible(
                                  key: ObjectKey(investment),
                                  onDismissed: (direction) {
                                    gameProvider.sellInvestment(investment);
                                    Navigator.of(context).pop();
                                  },
                                  background: Container(
                                    margin: const EdgeInsets.all(8),
                                    child: const Icon(Icons.delete),
                                  ),
                                  child: InvestmentCard(
                                      key: ObjectKey(investment),
                                      investment: investment),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
