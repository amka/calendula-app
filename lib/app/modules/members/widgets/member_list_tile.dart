import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

class MemberListTile extends StatelessWidget {
  const MemberListTile({
    super.key,
    required this.member,
  });

  final Membership member;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(radius: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(member.userName),
      subtitle: Text(member.userEmail),
      trailing: SizedBox(
        width: 160,
        child: Row(
          children: [
            Chip(
              label: Text(member.confirm ? 'Confirmed'.tr : 'Invited'.tr),
              backgroundColor: member.confirm
                  ? const Color(0xff87c271)
                  : Theme.of(context).colorScheme.error,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              side: BorderSide.none,
              visualDensity: VisualDensity.compact,
              onDeleted: member.confirm
                  ? null
                  : () {
                      EasyLoading.showSuccess('Invite sent');
                    },
              deleteButtonTooltipMessage: 'Re-send invite',
              deleteIcon: Icon(
                TablerIcons.mail_fast,
                size: 18,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        EasyLoading.showInfo('Edit ${member.userName}');
      },
    );
  }
}
