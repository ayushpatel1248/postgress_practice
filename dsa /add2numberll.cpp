
class Solution {
  public:
    Node* reverse(Node* head){
        Node* temp = head;
        Node* prev = NULL;
        while(temp != NULL){
            Node* ne = temp->next;
            temp -> next = prev;
            prev = temp;
            temp = ne;
        }
        return prev;
    }
    
    Node* addTwoLists(Node* head1, Node* head2) {
        // code here
        head1 = reverse(head1);
        head2 = reverse(head2);
        int ext = 0;
        Node * temp1 = head1;
        Node * temp2 = head2;
        Node* ansHead = NULL;
        Node* ansTemp = ansHead;
        
        while(temp1 != NULL && temp2 != NULL){
            int sum = temp1->data + temp2->data + ext;
            ext = sum/10;
            int rem = sum%10;
            Node* newNode = new Node(rem);
            if(ansHead == NULL){
                ansTemp = newNode;
                ansHead = newNode;
            }
            else{
                ansTemp -> next = newNode;
                ansTemp = ansTemp -> next;
            }
            temp1= temp1->next;
            temp2= temp2->next;
        }
        
        while(temp1 != NULL){
            int sum = temp1->data + ext;
            ext = sum/10;
            int rem = sum%10;
            Node* newNode = new Node(rem);
            ansTemp -> next = newNode;
            ansTemp = ansTemp -> next;
            temp1= temp1->next;
        }
        
        while(temp2 != NULL){
            int sum = temp2->data + ext;
            ext = sum/10;
            int rem = sum%10;
            Node* newNode = new Node(rem);
            ansTemp -> next = newNode;
            ansTemp = ansTemp -> next;
            temp2= temp2->next;
        }
        if(ext > 0){
            Node* newNode = new Node(ext);
            ansTemp -> next = newNode;
        }
        ansHead = reverse(ansHead);
        while(ansHead != NULL && ansHead->data == 0){
            ansHead = ansHead->next;
        }
        return ansHead;
    }
};