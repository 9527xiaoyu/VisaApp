//
//  AddAddressTableViewController.m
//  MyStretchHeader
//
//  Created by yxy on 17/3/11.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import "AddAddressTableViewController.h"
#import "AddAddressCell.h"
#import "ContentMsgTool.h"
#import "ChineseSorting.h"

#define Screen_Width [UIScreen mainScreen].bounds.size.width

@interface AddAddressTableViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)NSArray *addArray;
@property(nonatomic,strong)UILabel *lab;
@property(nonatomic,strong)UITextField *contactTF;
@property(nonatomic,strong)UILabel *contactLab;
@property(nonatomic,strong)UITextField *phoneTF;
@property(nonatomic,strong)UILabel *phoneLab;
@property(nonatomic,strong)UITextField *emailTF;
@property(nonatomic,strong)UILabel *emailLab;
@property(nonatomic,strong)UITextField *areaTF;
@property(nonatomic,strong)UILabel *areaLab;
@property(nonatomic,strong)UITextField *addressTF;
@property(nonatomic,strong)UILabel *addressLab;

@property(nonatomic,strong)UIButton *saveBtn;
@property(nonatomic,assign)NSNumber *editedID;
@property(nonatomic,assign)NSNumber *selectedType;
@end

@implementation AddAddressTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"新增地址";

    _editedID=_SA_model.SA_Id;
    _selectedType=_SA_model.SA_selected;
    _addArray=[NSArray arrayWithObjects:@"联系人",@"手机号",@"常用邮箱",@"所在地区",@"详细地址", nil];
   
    UIBarButtonItem *leftBtnItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=leftBtnItem;
    if ([self.type isEqualToString:@"edit"]) {
        UIBarButtonItem *rightBtnItem=[[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(delete)];
        rightBtnItem.tintColor=[UIColor redColor];
        self.navigationItem.rightBarButtonItem=rightBtnItem;
        
    }
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    [self.tableView registerClass:[AddAddressCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normalCell"];
    [self.tableView setScrollEnabled:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return _addArray.count;
    }else{
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGFLOAT_MIN;
    }
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        AddAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        return [self JuagementOfTypeIsEditOrAdd:cell IndexPath:indexPath];
        
    }else{
        UITableViewCell *normalCell=[tableView dequeueReusableCellWithIdentifier:@"normalCell"];
        _saveBtn=[[UIButton alloc]initWithFrame:CGRectMake(Screen_Width/2-80, 3, 160, 44)];
        [_saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        [_saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_saveBtn setBackgroundColor:[UIColor redColor]];
        [_saveBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        _saveBtn.layer.cornerRadius=6;
        _saveBtn.layer.borderWidth=0;
        [_saveBtn addTarget:self action:@selector(saveBtnTouched) forControlEvents:UIControlEventTouchUpInside];
        [normalCell addSubview:_saveBtn];
         return normalCell;
    }
   
}

#pragma mark ----- juagement Type Or Add
-(AddAddressCell*)JuagementOfTypeIsEditOrAdd:(AddAddressCell*)cell IndexPath:(NSIndexPath*)indexPath{
    cell.txtField.delegate=self;
    if ([_type isEqualToString:@"edit"]) {
        if (indexPath.row==0) {//联系人
            cell.lab.text=_addArray[indexPath.row];
            cell.lab.tag=indexPath.row+10;
            cell.lab.hidden=NO;
            cell.lab.textColor=[UIColor grayColor];
            
            cell.txtField.frame=CGRectMake(10, 20, Screen_Width, 30);
            cell.txtField.placeholder=_addArray[indexPath.row];
            cell.txtField.text=_SA_model.SA_name;
            cell.txtField.font=[UIFont systemFontOfSize:14];
            cell.txtField.tag=indexPath.row;
            cell.txtField.textColor=[UIColor grayColor];
            _contactTF=cell.txtField;
            _contactLab=cell.lab;
            return cell;
        }else if (indexPath.row==1){//电话
            cell.lab.text=_addArray[indexPath.row];
            cell.lab.tag=indexPath.row+10;
            cell.lab.hidden=NO;
            cell.lab.textColor=[UIColor grayColor];
            
            cell.txtField.frame=CGRectMake(10, 20, Screen_Width, 30);
            cell.txtField.placeholder=_addArray[indexPath.row];
            cell.txtField.text=_SA_model.SA_phoneNumber;
            cell.txtField.font=[UIFont systemFontOfSize:14];
            cell.txtField.tag=indexPath.row;
            cell.txtField.textColor=[UIColor grayColor];
            _phoneTF=cell.txtField;
            _phoneLab=cell.lab;
            return cell;
        }else if (indexPath.row==2){//邮箱
            cell.lab.text=_addArray[indexPath.row];
            cell.lab.tag=indexPath.row+10;
            cell.lab.hidden=NO;
            cell.lab.textColor=[UIColor grayColor];
            
            cell.txtField.frame=CGRectMake(10, 20, Screen_Width, 30);
            cell.txtField.placeholder=_addArray[indexPath.row];
            cell.txtField.text=_SA_model.SA_email;
            cell.txtField.font=[UIFont systemFontOfSize:14];
            cell.txtField.tag=indexPath.row;
            cell.txtField.textColor=[UIColor grayColor];
            _emailTF=cell.txtField;
            _emailLab=cell.lab;
            return cell;
        }else if (indexPath.row==3){//地区
            cell.lab.text=_addArray[indexPath.row];
            cell.lab.tag=indexPath.row+10;
            cell.lab.hidden=NO;
            cell.lab.textColor=[UIColor grayColor];
            
            cell.txtField.frame=CGRectMake(10, 20, Screen_Width, 30);
            cell.txtField.placeholder=_addArray[indexPath.row];
            cell.txtField.text=_SA_model.SA_area;
            cell.txtField.font=[UIFont systemFontOfSize:14];
            cell.txtField.tag=indexPath.row;
            cell.txtField.textColor=[UIColor grayColor];
            _areaTF=cell.txtField;
            _areaLab=cell.lab;
            return cell;
        }
            //地址
            cell.lab.text=_addArray[indexPath.row];
            cell.lab.tag=indexPath.row+10;
            cell.lab.hidden=NO;
            cell.lab.textColor=[UIColor grayColor];
        
            cell.txtField.frame=CGRectMake(10, 20, Screen_Width, 30);
            cell.txtField.placeholder=_addArray[indexPath.row];
            cell.txtField.text=_SA_model.SA_address;
            cell.txtField.font=[UIFont systemFontOfSize:14];
            cell.txtField.tag=indexPath.row;
            cell.txtField.textColor=[UIColor grayColor];
            _addressTF=cell.txtField;
            _addressLab=cell.lab;
            return cell;
        
    }else{
        
        if (indexPath.row==0) {//联系人
            cell.lab.text=_addArray[indexPath.row];
            cell.lab.tag=indexPath.row+10;
            cell.lab.textColor=[UIColor grayColor];
            cell.lab.hidden=YES;
            _contactTF=cell.txtField;
            _contactLab=cell.lab;
            cell.txtField.placeholder=_addArray[indexPath.row];
            cell.txtField.tag=indexPath.row;
            return cell;
        }else if (indexPath.row==1) {//电话
            cell.lab.text=_addArray[indexPath.row];
            cell.lab.tag=indexPath.row+10;
            cell.lab.textColor=[UIColor grayColor];
            cell.lab.hidden=YES;
            _phoneTF=cell.txtField;
            _phoneLab=cell.lab;
            cell.txtField.placeholder=_addArray[indexPath.row];
            cell.txtField.tag=indexPath.row;
            return cell;
        } else if  (indexPath.row==2) {//邮箱
            cell.lab.text=_addArray[indexPath.row];
            cell.lab.tag=indexPath.row+10;
            cell.lab.textColor=[UIColor grayColor];
            cell.lab.hidden=YES;
            _emailTF=cell.txtField;
            _emailLab=cell.lab;
            cell.txtField.placeholder=_addArray[indexPath.row];
            cell.txtField.tag=indexPath.row;
            return cell;
        }else if  (indexPath.row==3) {//地区
            cell.lab.text=_addArray[indexPath.row];
            cell.lab.tag=indexPath.row+10;
            cell.lab.textColor=[UIColor grayColor];
            cell.lab.hidden=YES;
            _areaTF=cell.txtField;
            _areaLab=cell.lab;
            cell.txtField.placeholder=_addArray[indexPath.row];
            cell.txtField.tag=indexPath.row;
            return cell;
        }
        //地址
        cell.lab.text=_addArray[indexPath.row];
        cell.lab.tag=indexPath.row+10;
        cell.lab.textColor=[UIColor grayColor];
        cell.lab.hidden=YES;
        _addressTF=cell.txtField;
        _addressLab=cell.lab;
        cell.txtField.placeholder=_addArray[indexPath.row];
        cell.txtField.tag=indexPath.row;
        return cell;
    }
}

#pragma mark ----- 保存/返回/删除按钮
-(void)saveBtnTouched{
//    FMDB
    NSString*contactStr=_contactTF.text;
    NSString*emailStr=_emailTF.text;
    NSString*phoneStr=_phoneTF.text;
    NSString *areaStr=_areaTF.text;
    NSString *addresStr=_addressTF.text;
    
    if ([_type isEqualToString:@"edit"]) {
        //编辑
        if (contactStr.length<2) {
            NSLog(@"6请输入正确的联系人姓名");
        }else{
            if ([[ChineseSorting sharedInstance]isValidateMobile:phoneStr]==NO) {
               NSLog(@"5请输入11位手机号");
            }else {
                if ([[ChineseSorting sharedInstance]isValidateEmail:emailStr]==NO) {
                    NSLog(@"4请输入正确的邮箱");
                }else{
                    if (areaStr.length==0) {
                       NSLog(@"3请输入正确的所在地区");
                    }else{
                        if (addresStr.length==0) {
                            NSLog(@"2请输入正确的详细地址");
                        }else{
                            NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:_editedID,@"id",_contactTF.text,@"name",_phoneTF.text,@"phoneNumber",_emailTF.text,@"email",_areaTF.text,@"area",_addressTF.text,@"address",_selectedType,@"selected", nil];
                            [[ContentMsgTool shareInstance]nicework_updateDatebaseWithDataDict:dict View:self.view];
                            [self.navigationController popViewControllerAnimated:YES];
                        }
                    }
                }
            }
        }
    }else{
        //添加
            if (contactStr.length<2) {
                NSLog(@"6请输入正确的联系人姓名");
            }else{
                if ([[ChineseSorting sharedInstance]isValidateMobile:phoneStr]==NO) {
                    NSLog(@"5请输入11位手机号");
                }else {
                    if ([[ChineseSorting sharedInstance]isValidateEmail:emailStr]==NO) {
                        NSLog(@"4请输入正确的邮箱");
                    }else{
                        if (areaStr.length==0) {
                            NSLog(@"3请输入正确的所在地区");
                        }else{
                            if (addresStr.length==0) {
                                NSLog(@"2请输入正确的详细地址");
                            }else{
                                NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:_contactTF.text,@"name",_phoneTF.text,@"phoneNumber",_emailTF.text,@"email",_areaTF.text,@"area",_addressTF.text,@"address",@"0",@"selected", nil];
                                [[ContentMsgTool shareInstance]nicework_insertDataBaseWithDataDict:dict View:self.view];
                                [self.navigationController popViewControllerAnimated:YES];
                            }
                        }
                    }
                }
            }
    }
    
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)delete{
    
}

#pragma mark ----- textfield Delegate协议
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self selectTFWithTag: textField.tag];
}
-(void)selectTFWithTag:(NSInteger)tag{
    
    UITextField *txtField=[[UITextField alloc]init];
    switch (tag) {
        case 0:
            txtField=_contactTF;
            _lab=_contactLab;
            break;
        case 1:
            txtField=_phoneTF;
            _lab=_phoneLab;
            break;
        case 2:
            txtField=_emailTF;
            _lab=_emailLab;
            break;
        case 3:
            txtField=_areaTF;
            _lab=_areaLab;
            break;
        case 4:
            txtField=_addressTF;
            _lab=_addressLab;
            break;
            
        default:
            break;
    }
    [txtField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld",(long)_inputTF.tag);
//}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    textField=_inputTF;
//    if (textField.tag==0) {
//        [textField setReturnKeyType:UIReturnKeyNext];
//    }
//    return YES;
//}

-(void)textFieldDidChange:(UITextField *)textField{
    if (textField.text.length==0) {
        [_lab setHidden:YES];
        
        textField.frame=CGRectMake(10, 0, Screen_Width, 50);
        textField.font=[UIFont systemFontOfSize:18];
    }else{
        _lab.frame=CGRectMake(10, 10, 100, 20);
        [_lab setHidden:NO];
        _lab.text=textField.placeholder;
        
        textField.frame=CGRectMake(10, 20, Screen_Width, 30);
        textField.font=[UIFont systemFontOfSize:14];
        textField.textColor=[UIColor grayColor];
        textField.backgroundColor=[UIColor clearColor];
    }

}

@end
