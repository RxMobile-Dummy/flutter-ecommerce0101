import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/presentation/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: GlobalVariables.yourOrders,
              onTap: () {},
            ),
            AccountButton(
              text: GlobalVariables.turnSeller,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: GlobalVariables.logOut,
              onTap: () => {}
                  //AccountServices().logOut(context),
            ),
            AccountButton(
              text: GlobalVariables.wishList,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
