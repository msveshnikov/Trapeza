# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
main=Category.create(ParentCategory_ID: 0, Title: "Национальные кухни мира").id
Category.create(ParentCategory_ID: main, Title: "Английская кухня", keywords: "англ,овсяная каша,пудинг,девоншир,британ,лондон,бирмингем,шотлан,пунш,ростбиф")
Category.create(ParentCategory_ID: main, Title: "Итальянская кухня", keywords: "италь,пицца,паста,ризотто,лазанья,фокачча,тоскан,флорент")
Category.create(ParentCategory_ID: main, Title: "Французская кухня", keywords: "устриц,франц,багет,круассан,луковый,париж,пармезан,марсель,бордо,беарн,фламбе")
Category.create(ParentCategory_ID: main, Title: "Немецкая кухня", keywords: "немец,бавар,айнтопф,берлин,саксон,щницель,штрудель,штоллен,гамбург,мюнхен")
Category.create(ParentCategory_ID: main, Title: "Японская кухня", keywords: "тофу,япон,васаби,суши,ролл,мисо,тамаго,воки,терияки,дзос,суси")
Category.create(ParentCategory_ID: main, Title: "Латиноамериканская кухня", keywords: "испан,мексик,латин,бразил,буррит,текил,гуако,тортиль,паэлья,андалу,мадрид,,барселон,каталон,")