//
//  HeaderFile.h
//  JackDeve
//
//  Created by apple on 17/5/9.
//  Copyright © 2017年 wkq. All rights reserved.
//

#ifndef HeaderFile_h
#define HeaderFile_h

#define HTTP_NEWURL @"http://daohe.apic.1by1.cc/"
//发送手机验证码
#define Send @"passport/send_sms_code?"

//用户注册

#define registe @"http://daohe.apic.1by1.cc/passport/register?mobile=%@&password=%@&sms_code=%@"


//用户登录
#define denglu @"http://daohe.apic.1by1.cc/passport/login?mobile=%@&password=%@"



//个人信息
#define geren @"http://daohe.apic.1by1.cc/user/info?token=%@"

//退出登录
#define Out  @"http://daohe.apic.1by1.cc/passport/logout?token=%@"

//修改密码
#define Change  @"http://daohe.apic.1by1.cc/passport/find_password?mobile=%@&password=%@&sms_code=%@"

#endif /* HeaderFile_h */
