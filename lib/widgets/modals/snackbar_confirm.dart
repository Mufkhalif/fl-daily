import 'package:flutter/material.dart';
import 'package:klikdaily/themes/theme.dart';

void showDialogConfirm({
  required String title,
  required Function() onConfirm,
  required BuildContext context,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    ),
    builder: (context) {
      return Card(
        color: Colors.white,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.5 -
              50 +
              MediaQuery.of(context).viewInsets.bottom,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Konfirmasi',
                  style: bold.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 12),
                Text(
                  'Apa anda yakin ingin menghapus $title dari keranjang Anda',
                  style: regular,
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onConfirm();
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            border: Border.all(
                              color: const Color(0xffEFEEFC),
                            ),
                          ),
                          child: Text(
                            'Konfirm',
                            textAlign: TextAlign.center,
                            style: regular.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            border: Border.all(
                              color: const Color(0xffEFEEFC),
                            ),
                          ),
                          child: Text(
                            'Batal',
                            textAlign: TextAlign.center,
                            style: regular.copyWith(
                              color: green,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
