import 'package:bankopol/enums/investment_type.dart';
import 'package:bankopol/models/investment.dart';
import 'package:flutter/material.dart';

class InvestmentCard extends StatelessWidget {
  final Investment investment;

  const InvestmentCard({
    required this.investment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/${investment.investmentType.name}.webp',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32.0),
          color: Colors.white.withOpacity(0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getInvestmentTypeName(investment.investmentType),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  shadows: [],
                ),
              ),
              Text(
                getInvestmentDescription(investment.investmentType),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Antal: ${investment.quantity}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Pris: ${investment.value.toInt()}',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
