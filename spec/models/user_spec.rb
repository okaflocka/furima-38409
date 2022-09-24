require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ユーザ名~生年月日のすべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ユーザ名が空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'wrongpass1'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'pass1'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが全角文字を含むと登録できない' do
        @user.password = 'ｐａｓｓ1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it '名字（全角）がブランクでは登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)姓を入力してください")
      end
      it '名前（全角）がブランクでは登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)名を入力してください")
      end
      it '名字（全角）に半角が含まれると登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)姓は不正な値です")
      end
      it '名前（全角）に半角が含まれると登録できない' do
        @user.first_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)名は不正な値です")
      end
      it '名字カナがブランクでは登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ姓を入力してください")
      end
      it '名前カナがブランクでは登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ名を入力してください")
      end
      it '名字（カナ）がカタカナ以外では登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ姓は不正な値です")
      end
      it '名前（カナ）がカタカナ以外では登録できない' do
        @user.first_name_kana = 'test用'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ名は不正な値です")
      end
      it '名前（カナ）が半角では登録できない' do
        @user.last_name_kana = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ姓は不正な値です")
      end
      it '生年月日がブランクでは登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
  
end

# bundle exec rspec spec/models/user_spec.rb