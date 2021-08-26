#!/usr/bin/python3
print("content-type: text/html")
print("Access-Control-Allow-Origin: *")
print()

import cgi
import pandas as pd
import numpy as np
from sklearn.linear_model import LogisticRegression


nm  = (cgi.FieldStorage()).getvalue("nm")
gn = (cgi.FieldStorage()).getvalue("gn")
age = (cgi.FieldStorage()).getvalue("age")
pclass = (cgi.FieldStorage()).getvalue("pclass")
parch = (cgi.FieldStorage()).getvalue("parch")
emb = (cgi.FieldStorage()).getvalue("emb")
user= list()


def gender_convert(g):

   if g=="M":
      user.append(1)
   else:
      user.append(0)



def pclass_convert(pcl):

   nl=list(np.zeros(2,dtype=int))

   if pcl == '2':
      nl[0]=1
   elif pcl == '3':
      nl[1]=1

   user.extend(nl)



def embark_convert(emb):

   nl=list(np.zeros(2,dtype=int))

   if emb=='Q':
      nl[0]=1
   elif emb=='S':
nl[1]=1

   user.extend(nl)


#Function 4
def parch_convert(prc):

   nl=list(np.zeros(3,dtype=int))

   if prc=='1':
      nl[0]=1
   elif prc=='2':
      nl[1]=1
   elif prc=='3':
      nl[2]=1

   user.extend(nl)



#Calling all the above declared functions to implement them inorder to store, logically numeric values .
gender_convert(gn)
pclass_convert(pclass)
embark_convert(emb)
parch_convert(parch)
user.append(int(age))

final_input=[user]



#The code for feature selection and data manipulation
dataset=pd.read_csv("titanic.csv")
y=dataset['Survived']

gender=pd.get_dummies(dataset['Sex'],drop_first=True)

pcl=pd.get_dummies(dataset['Pclass'],drop_first=True)
pcl.rename(columns={2:"class 2",3:"class 3"},inplace=True)

emb=pd.get_dummies(dataset['Embarked'],drop_first=True)

parch=pd.get_dummies(dataset['Parch'])
parch.drop([0,4,5,6],axis=1,inplace=True)
parch.rename(columns={1:"ratio 1",2:"ratio 2",3:"ratio 3"},inplace=True)
#The below function is created to fill out missing values in the age field of the dataset . To determine what value to be filled , the help of data visualization libraries like seaborn and matplotlib are taken.
def fill(col):

   pcl=col[0]
   age=col[1]

   if pd.isnull(age):
      if pcl==1:
         retiurn 38
      elif pcl==2:
         return 30
      elif pcl==3:
         return 25

   else:
      return age

age= dataset[['Pclass','Age']].apply(fill,axis=1)
age=pd.DataFrame(age)
age.rename(columns={0:"age"},inplace=True)


final_dataset= pd.concat([gender,pcl,emb,parch,age],axis=1)

#Training the model for binary classification using logistic regression .
model = LogisticRegression()
model.fit(final_dataset,y)

pred = model.predict(final_input)
#Condition for displaying the survival based on prediction
if pred==0:
  print(" NOT SURVIVE ")
else:
  print("SURVIVE")
