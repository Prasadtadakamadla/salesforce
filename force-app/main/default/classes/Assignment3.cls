public class Assignment3 {
    public static void RestrictUpdationEmail(List<contact> acc,map<id,contact> oldmap) {
        for (contact ac : acc) {
            if (oldmap!=null && ac.email!=oldmap.get(ac.id).email) {
                ac.addError('You cannot update the Email field of the Account.');
            }
        }
    }
}