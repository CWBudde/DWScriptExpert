object DataModuleScript: TDataModuleScript
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 356
  Width = 404
  object DelphiWebScript: TDelphiWebScript
    Left = 40
    Top = 16
  end
  object dwsDebugger: TdwsDebugger
    Left = 40
    Top = 160
  end
  object dwsRTTIConnector: TdwsRTTIConnector
    Script = DelphiWebScript
    StaticSymbols = False
    Left = 40
    Top = 112
  end
  object dwsGUIFunctions: TdwsGUIFunctions
    Left = 40
    Top = 208
  end
  object dwsComConnector: TdwsComConnector
    Script = DelphiWebScript
    StaticSymbols = True
    Left = 40
    Top = 64
  end
  object dwsUnitDelphiAST: TdwsUnit
    Script = DelphiWebScript
    Classes = <
      item
        Name = 'TSyntaxNode'
        Fields = <
          item
            Name = 'FParentNode'
            DataType = 'TSyntaxNode'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetType'
            ResultType = 'TSyntaxNodeType'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetTypeEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetCol'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetColEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetLine'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetLineEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetHasChildren'
            ResultType = 'Boolean'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasChildrenEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetHasAttributes'
            ResultType = 'Boolean'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetHasAttributesEval
            Kind = mkFunction
          end
          item
            Name = 'GetAttribute'
            Parameters = <
              item
                Name = 'Key'
                DataType = 'TAttributeName'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsTSyntaxNodeMethodsGetAttributeEval
            Kind = mkFunction
          end
          item
            Name = 'HasAttribute'
            Parameters = <
              item
                Name = 'Key'
                DataType = 'TAttributeName'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsTSyntaxNodeMethodsHasAttributeEval
            Kind = mkFunction
          end
          item
            Name = 'GetChildNodeCount'
            ResultType = 'Integer'
            OnEval = dwsTSyntaxNodeMethodsGetChildCountEval
            Kind = mkFunction
          end
          item
            Name = 'GetAttributeCount'
            ResultType = 'Integer'
            OnEval = dwsTSyntaxNodeMethodsGetAttributeCountEval
            Kind = mkFunction
          end
          item
            Name = 'GetAttributeKey'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'TAttributeName'
            OnEval = dwsTSyntaxNodeMethodsGetAttributeKeyEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetChildNode'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'TSyntaxNode'
            OnEval = dwsTSyntaxNodeMethodsGetChildNodeEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetParentNode'
            ResultType = 'TSyntaxNode'
            Kind = mkFunction
          end
          item
            Name = 'GetFileName'
            ResultType = 'String'
            OnEval = dwsUnitDelphiASTClassesTSyntaxNodeMethodsGetFileNameEval
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Col'
            DataType = 'Integer'
            ReadAccess = 'GetCol'
          end
          item
            Name = 'Line'
            DataType = 'Integer'
            ReadAccess = 'GetLine'
          end
          item
            Name = 'Type'
            DataType = 'TSyntaxNodeType'
            ReadAccess = 'GetType'
          end
          item
            Name = 'HasChildren'
            DataType = 'Boolean'
            ReadAccess = 'GetHasChildren'
          end
          item
            Name = 'HasAttributes'
            DataType = 'Boolean'
            ReadAccess = 'GetHasAttributes'
          end
          item
            Name = 'AttributeCount'
            DataType = 'Integer'
            ReadAccess = 'GetAttributeCount'
          end
          item
            Name = 'ChildNodeCount'
            DataType = 'Integer'
            ReadAccess = 'GetChildNodeCount'
          end
          item
            Name = 'AttributeKey'
            DataType = 'String'
            ReadAccess = 'GetAttributeKey'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'ChildNode'
            DataType = 'TSyntaxNode'
            ReadAccess = 'GetChildNode'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'ParentNode'
            DataType = 'TSyntaxNode'
            ReadAccess = 'GetParentNode'
          end
          item
            Name = 'FileName'
            DataType = 'String'
            ReadAccess = 'GetFileName'
          end>
      end
      item
        Name = 'TCompoundSyntaxNode'
        Ancestor = 'TSyntaxNode'
        Methods = <
          item
            Name = 'GetEndCol'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndColEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetEndLine'
            ResultType = 'Integer'
            OnEval = dwsUnitDelphiASTClassesTCompoundSyntaxNodeMethodsGetEndLineEval
            Visibility = cvPrivate
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'EndCol'
            DataType = 'Integer'
            ReadAccess = 'GetEndCol'
          end
          item
            Name = 'EndLine'
            DataType = 'Integer'
            ReadAccess = 'GetEndLine'
          end>
      end
      item
        Name = 'TValuedSyntaxNode'
        Ancestor = 'TSyntaxNode'
        Methods = <
          item
            Name = 'GetValue'
            ResultType = 'String'
            OnEval = dwsUnitDelphiASTClassesTValuedSyntaxNodeMethodsGetValueEval
            Kind = mkFunction
          end
          item
            Name = 'SetValue'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            OnEval = dwsUnitDelphiASTClassesTValuedSyntaxNodeMethodsSetValueEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Value'
            DataType = 'String'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
          end>
      end
      item
        Name = 'TCommentNode'
        Ancestor = 'TSyntaxNode'
        Methods = <
          item
            Name = 'GetText'
            ResultType = 'String'
            OnEval = dwsUnitDelphiASTClassesTCommentNodeMethodsGetTextEval
            Kind = mkFunction
          end
          item
            Name = 'SetText'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'String'
              end>
            OnEval = dwsUnitDelphiASTClassesTCommentNodeMethodsSetTextEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Text'
            DataType = 'String'
            ReadAccess = 'GetText'
            WriteAccess = 'SetText'
          end>
      end>
    Enumerations = <
      item
        Name = 'TSyntaxNodeType'
        Elements = <
          item
            Name = 'ntUnknown'
          end
          item
            Name = 'ntAdd'
          end
          item
            Name = 'ntAddr'
          end
          item
            Name = 'ntAlignmentParam'
          end
          item
            Name = 'ntAnd'
          end
          item
            Name = 'ntAnonymousMethod'
          end
          item
            Name = 'ntArguments'
          end
          item
            Name = 'ntAs'
          end
          item
            Name = 'ntAssign'
          end
          item
            Name = 'ntAt'
          end
          item
            Name = 'ntAttribute'
          end
          item
            Name = 'ntAttributes'
          end
          item
            Name = 'ntBounds'
          end
          item
            Name = 'ntCall'
          end
          item
            Name = 'ntCase'
          end
          item
            Name = 'ntCaseElse'
          end
          item
            Name = 'ntCaseLabel'
          end
          item
            Name = 'ntCaseLabels'
          end
          item
            Name = 'ntCaseSelector'
          end
          item
            Name = 'ntConstant'
          end
          item
            Name = 'ntConstants'
          end
          item
            Name = 'ntContains'
          end
          item
            Name = 'ntDeref'
          end
          item
            Name = 'ntDimension'
          end
          item
            Name = 'ntDiv'
          end
          item
            Name = 'ntDot'
          end
          item
            Name = 'ntDownTo'
          end
          item
            Name = 'ntElement'
          end
          item
            Name = 'ntElse'
          end
          item
            Name = 'ntEmptyStatement'
          end
          item
            Name = 'ntEnum'
          end
          item
            Name = 'ntEqual'
          end
          item
            Name = 'ntExcept'
          end
          item
            Name = 'ntExceptionHandler'
          end
          item
            Name = 'ntExports'
          end
          item
            Name = 'ntExpression'
          end
          item
            Name = 'ntExpressions'
          end
          item
            Name = 'ntFDiv'
          end
          item
            Name = 'ntField'
          end
          item
            Name = 'ntFields'
          end
          item
            Name = 'ntFinalization'
          end
          item
            Name = 'ntFinally'
          end
          item
            Name = 'ntFor'
          end
          item
            Name = 'ntFrom'
          end
          item
            Name = 'ntGeneric'
          end
          item
            Name = 'ntGoto'
          end
          item
            Name = 'ntGreater'
          end
          item
            Name = 'ntGreaterEqual'
          end
          item
            Name = 'ntGuid'
          end
          item
            Name = 'ntIdentifier'
          end
          item
            Name = 'ntIf'
          end
          item
            Name = 'ntImplementation'
          end
          item
            Name = 'ntImplements'
          end
          item
            Name = 'ntIn'
          end
          item
            Name = 'ntIndexed'
          end
          item
            Name = 'ntInherited'
          end
          item
            Name = 'ntInitialization'
          end
          item
            Name = 'ntInterface'
          end
          item
            Name = 'ntIs'
          end
          item
            Name = 'ntLabel'
          end
          item
            Name = 'ntLHS'
          end
          item
            Name = 'ntLiteral'
          end
          item
            Name = 'ntLower'
          end
          item
            Name = 'ntLowerEqual'
          end
          item
            Name = 'ntMethod'
          end
          item
            Name = 'ntMod'
          end
          item
            Name = 'ntMul'
          end
          item
            Name = 'ntName'
          end
          item
            Name = 'ntNamedArgument'
          end
          item
            Name = 'ntNotEqual'
          end
          item
            Name = 'ntNot'
          end
          item
            Name = 'ntOr'
          end
          item
            Name = 'ntPackage'
          end
          item
            Name = 'ntParameter'
          end
          item
            Name = 'ntParameters'
          end
          item
            Name = 'ntPath'
          end
          item
            Name = 'ntPositionalArgument'
          end
          item
            Name = 'ntProtected'
          end
          item
            Name = 'ntPrivate'
          end
          item
            Name = 'ntProperty'
          end
          item
            Name = 'ntPublic'
          end
          item
            Name = 'ntPublished'
          end
          item
            Name = 'ntRaise'
          end
          item
            Name = 'ntRead'
          end
          item
            Name = 'ntRepeat'
          end
          item
            Name = 'ntRequires'
          end
          item
            Name = 'ntReturnType'
          end
          item
            Name = 'ntRHS'
          end
          item
            Name = 'ntRoundClose'
          end
          item
            Name = 'ntRoundOpen'
          end
          item
            Name = 'ntSet'
          end
          item
            Name = 'ntShl'
          end
          item
            Name = 'ntShr'
          end
          item
            Name = 'ntStatement'
          end
          item
            Name = 'ntStatements'
          end
          item
            Name = 'ntSub'
          end
          item
            Name = 'ntSubrange'
          end
          item
            Name = 'ntThen'
          end
          item
            Name = 'ntTo'
          end
          item
            Name = 'ntTry'
          end
          item
            Name = 'ntType'
          end
          item
            Name = 'ntTypeArgs'
          end
          item
            Name = 'ntTypeDecl'
          end
          item
            Name = 'ntTypeParams'
          end
          item
            Name = 'ntTypeSection'
          end
          item
            Name = 'ntValue'
          end
          item
            Name = 'ntVariable'
          end
          item
            Name = 'ntVariables'
          end
          item
            Name = 'ntXor'
          end
          item
            Name = 'ntUnaryMinus'
          end
          item
            Name = 'ntUnit'
          end
          item
            Name = 'ntUses'
          end
          item
            Name = 'ntWhile'
          end
          item
            Name = 'ntWith'
          end
          item
            Name = 'ntWrite'
          end>
      end
      item
        Name = 'TAttributeName'
        Elements = <
          item
            Name = 'anType'
          end
          item
            Name = 'anClass'
          end
          item
            Name = 'anForwarded'
          end
          item
            Name = 'anKind'
          end
          item
            Name = 'anName'
          end
          item
            Name = 'anVisibility'
          end
          item
            Name = 'anCallingConvention'
          end
          item
            Name = 'anPath'
          end
          item
            Name = 'anMethodBinding'
          end
          item
            Name = 'anReintroduce'
          end
          item
            Name = 'anOverload'
          end
          item
            Name = 'anAbstract'
          end>
      end>
    Functions = <
      item
        Name = 'ExportAbstractSyntaxTreeToXML'
        Parameters = <
          item
            Name = 'FileName'
            DataType = 'String'
          end>
        OnEval = dwsUnitDelphiASTFunctionsExportSyntaxTreeToXMLEval
      end
      item
        Name = 'GetAbstractSyntaxTree'
        Parameters = <
          item
            Name = 'InterfaceOnly'
            DataType = 'Boolean'
            HasDefaultValue = True
            DefaultValue = False
          end>
        ResultType = 'TSyntaxNode'
        OnEval = dwsUnitDelphiASTFunctionsGetAbstractSyntaxTreeEval
      end
      item
        Name = 'SyntaxNodeTypeToString'
        Parameters = <
          item
            Name = 'SyntaxNodeType'
            DataType = 'TSyntaxNodeType'
          end>
        ResultType = 'String'
        OnEval = dwsUnitDelphiASTFunctionsSyntaxNodeTypeToStringEval
      end
      item
        Name = 'SyntaxNodeTypeToName'
        Parameters = <
          item
            Name = 'SyntaxNodeType'
            DataType = 'TSyntaxNodeType'
          end>
        ResultType = 'String'
        OnEval = dwsUnitDelphiASTFunctionsSyntaxNodeTypeToNameEval
      end>
    UnitName = 'DelphiAST'
    StaticSymbols = False
    Left = 168
    Top = 64
  end
  object dwsUnitInternal: TdwsUnit
    Script = DelphiWebScript
    Functions = <
      item
        Name = 'WriteLn'
        Parameters = <
          item
            Name = 'Input'
            DataType = 'Variant'
          end>
        OnEval = dwsUnitInternalFunctionsWriteLnEval
      end>
    UnitName = 'EditorForm'
    StaticSymbols = False
    Left = 168
    Top = 16
  end
  object dwsUnitEditor: TdwsUnit
    Script = DelphiWebScript
    Classes = <
      item
        Name = 'IOTAEditor'
        Methods = <
          item
            Name = 'GetFileName'
            ResultType = 'string'
            OnEval = dwsUnitEditorClassesIOTAEditorMethodsGetFileNameEval
            Kind = mkFunction
          end
          item
            Name = 'GetModified'
            ResultType = 'Boolean'
            OnEval = dwsUnitEditorClassesIOTAEditorMethodsGetModifiedEval
            Kind = mkFunction
          end
          item
            Name = 'MarkModified'
            ResultType = 'Boolean'
            OnEval = dwsUnitEditorClassesIOTAEditorMethodsMarkModifiedEval
            Kind = mkFunction
          end
          item
            Name = 'Show'
            OnEval = dwsUnitEditorClassesIOTAEditorMethodsShowEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'FileName'
            DataType = 'string'
            ReadAccess = 'GetFileName'
          end
          item
            Name = 'Modified'
            DataType = 'Boolean'
            ReadAccess = 'GetModified'
          end>
      end
      item
        Name = 'IOTAEditorContent'
        Methods = <
          item
            Name = 'GetContentAge'
            ResultType = 'TDateTime'
            Kind = mkFunction
          end>
      end
      item
        Name = 'IOTAEditReader'
      end
      item
        Name = 'IOTAEditWriter'
        Methods = <
          item
            Name = 'CopyTo'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'DeleteTo'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Insert'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Position'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetCurrentPos'
            ResultType = 'TOTACharPos'
            Visibility = cvPrivate
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'CurrentPos'
            DataType = 'TOTACharPos'
            ReadAccess = 'GetCurrentPos'
          end>
      end
      item
        Name = 'IOTAHighlighter'
        Methods = <
          item
            Name = 'GetIDString'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetName'
            ResultType = 'string'
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Name'
            DataType = 'string'
            ReadAccess = 'GetName'
          end
          item
            Name = 'IDString'
            DataType = 'string'
            ReadAccess = 'GetIDString'
          end>
      end
      item
        Name = 'IOTACustomEditView'
        Methods = <
          item
            Name = 'SameView'
            Parameters = <
              item
                Name = 'EditView'
                DataType = 'IOTACustomEditView'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end>
      end
      item
        Name = 'IOTAEditView40'
        Methods = <
          item
            Name = 'GetCursorPos'
            ResultType = 'TOTAEditPos'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetCursorPos'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TOTAEditPos'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetTopPos'
            ResultType = 'TOTAEditPos'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetTopPos'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TOTAEditPos'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetViewSize'
            ResultType = 'TSize'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'PosToCharPos'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'Integer'
              end>
            ResultType = 'TOTACharPos'
            Kind = mkFunction
          end
          item
            Name = 'CharPosToPos'
            Parameters = <
              item
                Name = 'CharPos'
                DataType = 'TOTACharPos'
              end>
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'ConvertPos'
            Parameters = <
              item
                Name = 'EdPosToCharPos'
                DataType = 'Boolean'
              end
              item
                Name = 'EditPos'
                DataType = 'TOTAEditPos'
                IsVarParam = True
              end
              item
                Name = 'CharPos'
                DataType = 'TOTACharPos'
                IsVarParam = True
              end>
            Kind = mkProcedure
          end
          item
            Name = 'GetAttributeAtPos'
            Parameters = <
              item
                Name = 'EdPos'
                DataType = 'TOTAEditPos'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'IncludeMargin'
                DataType = 'Boolean'
              end
              item
                Name = 'Element'
                DataType = 'Integer'
                IsVarParam = True
              end
              item
                Name = 'LineFlag'
                DataType = 'Integer'
                IsVarParam = True
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SameView'
            Parameters = <
              item
                Name = 'EditView'
                DataType = 'IOTAEditView'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'CursorPos'
            DataType = 'TOTAEditPos'
            ReadAccess = 'GetCursorPos'
            WriteAccess = 'SetCursorPos'
          end
          item
            Name = 'TopPos'
            DataType = 'TOTAEditPos'
            ReadAccess = 'GetTopPos'
            WriteAccess = 'SetTopPos'
          end
          item
            Name = 'ViewSize'
            DataType = 'TSize'
            ReadAccess = 'GetViewSize'
          end>
      end
      item
        Name = 'IOTASearchOptions'
        Methods = <
          item
            Name = 'GetCaseSensitive'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetDirection'
            ResultType = 'TSearchDirection'
            Kind = mkFunction
          end
          item
            Name = 'GetFromCursor'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetRegularExpression'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetSearchText'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetWholeFile'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetWordBoundary'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'SetCaseSensitive'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetDirection'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TSearchDirection'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetFromCursor'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetRegularExpression'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetSearchText'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetWholeFile'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetWordBoundary'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'CaseSensitive'
            DataType = 'Boolean'
            ReadAccess = 'GetCaseSensitive'
            WriteAccess = 'SetCaseSensitive'
          end
          item
            Name = 'Direction'
            DataType = 'TSearchDirection'
            ReadAccess = 'GetDirection'
            WriteAccess = 'SetDirection'
          end
          item
            Name = 'FromCursor'
            DataType = 'Boolean'
            ReadAccess = 'GetFromCursor'
            WriteAccess = 'SetFromCursor'
          end
          item
            Name = 'RegularExpression'
            DataType = 'Boolean'
            ReadAccess = 'GetRegularExpression'
            WriteAccess = 'SetRegularExpression'
          end
          item
            Name = 'SearchText'
            DataType = 'string'
            ReadAccess = 'GetSearchText'
            WriteAccess = 'SetSearchText'
          end
          item
            Name = 'WholeFile'
            DataType = 'Boolean'
            ReadAccess = 'GetWholeFile'
            WriteAccess = 'SetWholeFile'
          end
          item
            Name = 'WordBoundary'
            DataType = 'Boolean'
            ReadAccess = 'GetWordBoundary'
            WriteAccess = 'SetWordBoundary'
          end>
      end
      item
        Name = 'IOTAReplaceOptions'
        Methods = <
          item
            Name = 'GetPromptOnReplace'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetReplaceAll'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetReplaceText'
            ResultType = 'string'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetPromptOnReplace'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetReplaceAll'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetReplaceText'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'PromptOnReplace'
            DataType = 'Boolean'
            ReadAccess = 'GetPromptOnReplace'
            WriteAccess = 'SetPromptOnReplace'
          end
          item
            Name = 'ReplaceAll'
            DataType = 'Boolean'
            ReadAccess = 'GetReplaceAll'
            WriteAccess = 'SetReplaceAll'
          end
          item
            Name = 'ReplaceText'
            DataType = 'string'
            ReadAccess = 'GetReplaceText'
            WriteAccess = 'SetReplaceText'
          end>
      end
      item
        Name = 'IOTAEditPosition'
        Methods = <
          item
            Name = 'Align'
            Parameters = <
              item
                Name = 'Magnitude'
                DataType = 'Integer'
              end>
            OnEval = dwsUnitEditorClassesIOTAEditPositionMethodsAlignEval
            Kind = mkProcedure
          end
          item
            Name = 'BackspaceDelete'
            Parameters = <
              item
                Name = 'HowMany'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            OnEval = dwsUnitEditorClassesIOTAEditPositionMethodsBackspaceDeleteEval
            Kind = mkFunction
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'HowMany'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'DistanceToTab'
            Parameters = <
              item
                Name = 'Direction'
                DataType = 'TSearchDirection'
              end>
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetCharacter'
            ResultType = 'String'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetColumn'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetIsSpecialCharacter'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetIsWhitespace'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetIsWordCharacter'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetLastRow'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetReplaceOptions'
            ResultType = 'IOTAReplaceOptions'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetRow'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetSearchErrorString'
            Parameters = <
              item
                Name = 'ErrorCode'
                DataType = 'Integer'
              end>
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetSearchOptions'
            ResultType = 'IOTASearchOptions'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GotoLine'
            Parameters = <
              item
                Name = 'LineNumber'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'InsertBlock'
            Parameters = <
              item
                Name = 'Block'
                DataType = 'IOTAEditBlock'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'InsertCharacter'
            Parameters = <
              item
                Name = 'Character'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'InsertFile'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'InsertText'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Move'
            Parameters = <
              item
                Name = 'Row'
                DataType = 'Integer'
              end
              item
                Name = 'Col'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveBOL'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveCursor'
            Parameters = <
              item
                Name = 'MoveMask'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveEOF'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveEOL'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveReal'
            Parameters = <
              item
                Name = 'Row'
                DataType = 'Integer'
              end
              item
                Name = 'Col'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'MoveRelative'
            Parameters = <
              item
                Name = 'Row'
                DataType = 'Integer'
              end
              item
                Name = 'Col'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'procedure Paste;'
            Kind = mkProcedure
          end
          item
            Name = 'Read'
            Parameters = <
              item
                Name = 'NumberOfCharacters'
                DataType = 'Integer'
              end>
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'RepeatLastSearchOrReplace'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'Replace'
            Parameters = <
              item
                Name = 'Pattern'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'ReplaceText'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'CaseSensitive'
                DataType = 'Boolean'
              end
              item
                Name = 'RegularExpression'
                DataType = 'Boolean'
              end
              item
                Name = 'WholeFile'
                DataType = 'Boolean'
              end
              item
                Name = 'Direction'
                DataType = 'TSearchDirection'
              end
              item
                Name = 'ErrorCode'
                DataType = 'Integer'
                IsVarParam = True
              end>
            ResultType = 'Integer'
            Overloaded = True
            Kind = mkFunction
          end
          item
            Name = 'Replace'
            ResultType = 'Integer'
            Overloaded = True
            Kind = mkFunction
          end
          item
            Name = 'ReplaceAgain'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'procedure Restore;'
            Kind = mkProcedure
          end
          item
            Name = 'RipText'
            Parameters = <
              item
                Name = 'ValidChars'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'RipFlags'
                DataType = 'Integer'
              end>
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'procedure Save;'
            Kind = mkProcedure
          end
          item
            Name = 'Search'
            Parameters = <
              item
                Name = 'Pattern'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'CaseSensitive'
                DataType = 'Boolean'
              end
              item
                Name = 'RegularExpression'
                DataType = 'Boolean'
              end
              item
                Name = 'WholeFile'
                DataType = 'Boolean'
              end
              item
                Name = 'Direction'
                DataType = 'TSearchDirection'
              end
              item
                Name = 'ErrorCode'
                DataType = 'Integer'
                IsVarParam = True
              end>
            ResultType = 'Boolean'
            Overloaded = True
            Kind = mkFunction
          end
          item
            Name = 'Search'
            ResultType = 'Boolean'
            Overloaded = True
            Kind = mkFunction
          end
          item
            Name = 'SearchAgain'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'Tab'
            Parameters = <
              item
                Name = 'Magnitude'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Character'
            DataType = 'String'
            ReadAccess = 'GetCharacter'
          end
          item
            Name = 'Column'
            DataType = 'Integer'
            ReadAccess = 'GetColumn'
          end
          item
            Name = 'IsSpecialCharacter'
            DataType = 'Boolean'
            ReadAccess = 'GetIsSpecialCharacter'
          end
          item
            Name = 'IsWhiteSpace'
            DataType = 'Boolean'
            ReadAccess = 'GetIsWhiteSpace'
          end
          item
            Name = 'IsWordCharacter'
            DataType = 'Boolean'
            ReadAccess = 'GetIsWordCharacter'
          end
          item
            Name = 'LastRow'
            DataType = 'Integer'
            ReadAccess = 'GetLastRow'
          end
          item
            Name = 'ReplaceOptions'
            DataType = 'IOTAReplaceOptions'
            ReadAccess = 'GetReplaceOptions'
          end
          item
            Name = 'Row'
            DataType = 'Integer'
            ReadAccess = 'GetRow'
          end
          item
            Name = 'SearchOptions'
            DataType = 'IOTASearchOptions'
            ReadAccess = 'GetSearchOptions'
          end>
      end
      item
        Name = 'IOTASyncEditPoint100'
      end
      item
        Name = 'IOTASyncEditPoint'
      end
      item
        Name = 'IOTASyncEditPoints'
      end
      item
        Name = 'IOTAEditBlock90'
      end
      item
        Name = 'IOTAEditBlock'
      end
      item
        Name = 'INTAEditWindow'
      end
      item
        Name = 'IOTAEditView140'
        Ancestor = 'IOTAEditView40'
      end
      item
        Name = 'IOTAEditView145'
        Ancestor = 'IOTAEditView140'
      end
      item
        Name = 'IOTAEditView'
        Ancestor = 'IOTAEditView145'
      end
      item
        Name = 'IOTASourceEditor70'
        Ancestor = 'IOTAEditor'
      end
      item
        Name = 'IOTASourceEditor'
        Ancestor = 'IOTASourceEditor70'
      end
      item
        Name = 'IOTAEditLineTracker'
      end
      item
        Name = 'IOTAEditBuffer60'
        Ancestor = 'IOTASourceEditor'
      end
      item
        Name = 'IOTAEditBuffer'
        Ancestor = 'IOTAEditBuffer60'
      end
      item
        Name = 'IOTAEditBufferIterator'
      end
      item
        Name = 'IOTAKeyContext'
      end
      item
        Name = 'IOTAKeyboardServices'
      end
      item
        Name = 'IOTASpeedSetting'
        Methods = <
          item
            Name = 'GetDisplayName'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetName'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'ExecuteSetting'
            Parameters = <
              item
                Name = 'EditOptions'
                DataType = 'IOTAEditOptions'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'DisplayName'
            DataType = 'string'
            ReadAccess = 'GetDisplayName'
          end
          item
            Name = 'Name'
            DataType = 'string'
            ReadAccess = 'GetName'
          end>
      end
      item
        Name = 'IOTAEditOptions60'
        Methods = <
          item
            Name = 'AddSpeedSetting'
            Parameters = <
              item
                Name = 'SpeedSetting'
                DataType = 'IOTASpeedSetting'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'procedure BeginUpdate;'
            Kind = mkProcedure
          end
          item
            Name = 'procedure EndUpdate;'
            Kind = mkProcedure
          end
          item
            Name = 'GetBlockIndent'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetBufferOptions'
            ResultType = 'IOTABufferOptions'
            Kind = mkFunction
          end
          item
            Name = 'GetFontName'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetFontSize'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetForceCutCopyEnabled'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetSpeedSettingCount'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetSpeedSetting'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'IOTASpeedSetting'
            Kind = mkFunction
          end
          item
            Name = 'GetUseBriefCursorShapes'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetUseBriefRegularExpressions'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'RemoveSpeedSetting'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetBlockIndent'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetFontName'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetFontSize'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetForceCutCopyEnabled'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetSpeedSetting'
            Parameters = <
              item
                Name = 'Name'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetUseBriefCursorShapes'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetUseBriefRegularExpressions'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'BlockIndent'
            DataType = 'Integer'
            ReadAccess = 'GetBlockIndent'
            WriteAccess = 'SetBlockIndent'
          end
          item
            Name = 'BufferOptions'
            DataType = 'IOTABufferOptions'
            ReadAccess = 'GetBufferOptions'
          end
          item
            Name = 'FontName'
            DataType = 'string'
            ReadAccess = 'GetFontName'
            WriteAccess = 'SetFontName'
          end
          item
            Name = 'FontSize'
            DataType = 'Integer'
            ReadAccess = 'GetFontSize'
            WriteAccess = 'SetFontSize'
          end
          item
            Name = 'ForceCutCopyEnabled'
            DataType = 'Boolean'
            ReadAccess = 'GetForceCutCopyEnabled'
            WriteAccess = 'SetForceCutCopyEnabled'
          end
          item
            Name = 'SpeedSettingCount'
            DataType = 'Integer'
            ReadAccess = 'GetSpeedSettingCount'
          end
          item
            Name = 'SpeedSettings'
            DataType = 'IOTASpeedSetting'
            ReadAccess = 'GetSpeedSetting'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'UseBriefCursorShapes'
            DataType = 'Boolean'
            ReadAccess = 'GetUseBriefCursorShapes'
            WriteAccess = 'SetUseBriefCursorShapes'
          end
          item
            Name = 'UseBriefRegularExpressions'
            DataType = 'Boolean'
            ReadAccess = 'GetUseBriefRegularExpressions'
            WriteAccess = 'SetUseBriefRegularExpressions'
          end>
      end
      item
        Name = 'IOTAEditOptions'
        Ancestor = 'IOTAEditOptions60'
        Methods = <
          item
            Name = 'GetExtensions'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetOptionsName'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetOptionsIDString'
            ResultType = 'string'
            Kind = mkFunction
          end
          item
            Name = 'GetSyntaxHighlighter'
            ResultType = 'IOTAHighlighter'
            Kind = mkFunction
          end
          item
            Name = 'GetOptionsIndex'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'SetExtensions'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetOptionsName'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetSyntaxHighlighter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'IOTAHighlighter'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Extensions'
            DataType = 'string'
            ReadAccess = 'GetExtensions'
            WriteAccess = 'SetExtensions'
          end
          item
            Name = 'OptionsName'
            DataType = 'string'
            ReadAccess = 'GetOptionsName'
            WriteAccess = 'SetOptionsName'
          end
          item
            Name = 'IDString'
            DataType = 'string'
            ReadAccess = 'GetOptionsIDString'
          end
          item
            Name = 'SyntaxHighlighter'
            DataType = 'IOTAHighlighter'
            ReadAccess = 'GetSyntaxHighlighter'
            WriteAccess = 'SetSyntaxHighlighter'
          end
          item
            Name = 'OptionsIndex'
            DataType = 'Integer'
            ReadAccess = 'GetOptionsIndex'
          end>
      end
      item
        Name = 'IOTAEditorServices60'
        IsStatic = True
        Methods = <
          item
            Name = 'GetEditOptions'
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices60MethodsGetEditOptionsEval
            Kind = mkFunction
          end
          item
            Name = 'GetKeyboardServices'
            ResultType = 'IOTAKeyboardServices'
            OnEval = dwsUnitEditorClassesIOTAEditorServices60MethodsGetKeyboardServicesEval
            Kind = mkFunction
          end
          item
            Name = 'GetTopBuffer'
            ResultType = 'IOTAEditBuffer'
            OnEval = dwsUnitEditorClassesIOTAEditorServices60MethodsGetTopBufferEval
            Kind = mkFunction
          end
          item
            Name = 'GetTopView'
            ResultType = 'IOTAEditView'
            OnEval = dwsUnitEditorClassesIOTAEditorServices60MethodsGetTopViewEval
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'EditOptions'
            DataType = 'IOTAEditOptions'
            ReadAccess = 'GetEditOptions'
          end
          item
            Name = 'KeyboardServices'
            DataType = 'IOTAKeyboardServices'
            ReadAccess = 'GetKeyboardServices'
          end
          item
            Name = 'TopBuffer'
            DataType = 'IOTAEditBuffer'
            ReadAccess = 'GetTopBuffer'
          end
          item
            Name = 'TopView'
            DataType = 'IOTAEditView'
            ReadAccess = 'GetTopView'
          end>
      end
      item
        Name = 'IOTAEditorServices70'
        Ancestor = 'IOTAEditorServices60'
        IsStatic = True
        Methods = <
          item
            Name = 'GetEditOptionsCount'
            ResultType = 'Integer'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsCountEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetEditOptionsIndex'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsIndexEval
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetEditOptions'
            Parameters = <
              item
                Name = 'IDString'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsEval
            Kind = mkFunction
          end
          item
            Name = 'GetEditOptionsForFile'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsGetEditOptionsForFileEval
            Kind = mkFunction
          end
          item
            Name = 'AddEditOptions'
            Parameters = <
              item
                Name = 'IDString'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'IOTAEditOptions'
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsAddEditOptionsEval
            Kind = mkFunction
          end
          item
            Name = 'DeleteEditOptions'
            Parameters = <
              item
                Name = 'IDString'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitEditorClassesIOTAEditorServices70MethodsDeleteEditOptionsEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'EditOptionsCount'
            DataType = 'Integer'
            ReadAccess = 'GetEditOptionsCount'
          end
          item
            Name = 'EditorOptions'
            DataType = 'IOTAEditOptions'
            ReadAccess = 'GetEditOptionsIndex'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end>
      end
      item
        Name = 'IOTAEditorServices80'
        Ancestor = 'IOTAEditorServices70'
        IsStatic = True
      end
      item
        Name = 'IOTAEditorServices'
        Ancestor = 'IOTAEditorServices80'
        IsStatic = True
        Methods = <
          item
            Name = 'GetEditOptionsIDString'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'String'
            OnEval = dwsUnitEditorClassesIOTAEditorServicesMethodsGetEditOptionsIDStringEval
            Kind = mkFunction
          end>
      end
      item
        Name = 'INTAEditorServices'
        Methods = <
          item
            Name = 'GetEditWindowCount'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetEditWindow'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'INTAEditWindow'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetTopEditWindow'
            ResultType = 'INTAEditWindow'
            Visibility = cvPrivate
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'EditWindowCount'
            DataType = 'Integer'
            ReadAccess = 'GetEditWindowCount'
          end
          item
            Name = 'EditWindow'
            DataType = 'INTAEditWindow'
            ReadAccess = 'GetEditWindow'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'TopEditWindow'
            DataType = 'INTAEditWindow'
            ReadAccess = 'GetTopEditWindow'
          end>
      end
      item
        Name = 'INTACustomEditorView'
      end
      item
        Name = 'INTACustomEditorView150'
        Ancestor = 'INTACustomEditorView'
      end
      item
        Name = 'INTACustomEditorViewState'
      end
      item
        Name = 'INTACustomEditorViewStatusPanel'
      end
      item
        Name = 'INTACustomEditorSubView'
      end
      item
        Name = 'IOTAEditorViewServices140'
      end
      item
        Name = 'IOTAEditorViewServices'
        Ancestor = 'IOTAEditorViewServices140'
      end
      item
        Name = 'INTAEditorViewServices'
      end
      item
        Name = 'IOTABufferOptions60'
        Methods = <
          item
            Name = 'GetAutoIndent'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetBackspaceUnindents'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetCreateBackupFile'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetCursorThroughTabs'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetInsertMode'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetGroupUndo'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetKeepTrailingBlanks'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetLeftGutterWidth'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetRightMargin'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetOverwriteBlocks'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetPersistentBlocks'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetPreserveLineEnds'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetSmartTab'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetSyntaxHighlight'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetTabStops'
            ResultType = 'string'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetUndoAfterSave'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetUndoLimit'
            ResultType = 'Integer'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetUseTabCharacter'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetAutoIndent'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetBackspaceUnindents'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetCreateBackupFile'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetCursorThroughTabs'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetInsertMode'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetGroupUndo'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetKeepTrailingBlanks'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetLeftGutterWidth'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetRightMargin'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetOverwriteBlocks'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetPersistentBlocks'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetPreserveLineEnds'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetSmartTab'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetSyntaxHighlight'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetTabStops'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetUndoAfterSave'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetUndoLimit'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetUseTabCharacter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'AutoIndent'
            DataType = 'Boolean'
            ReadAccess = 'GetAutoIndent'
            WriteAccess = 'SetAutoIndent'
          end
          item
            Name = 'BackspaceUnindents'
            DataType = 'Boolean'
            ReadAccess = 'GetBackspaceUnindents'
            WriteAccess = 'SetBackspaceUnindents'
          end
          item
            Name = 'CreateBackupFile'
            DataType = 'Boolean'
            ReadAccess = 'GetCreateBackupFile'
            WriteAccess = 'SetCreateBackupFile'
          end
          item
            Name = 'CursorThroughTabs'
            DataType = 'Boolean'
            ReadAccess = 'GetCursorThroughTabs'
            WriteAccess = 'SetCursorThroughTabs'
          end
          item
            Name = 'InsertMode'
            DataType = 'Boolean'
            ReadAccess = 'GetInsertMode'
            WriteAccess = 'SetInsertMode'
          end
          item
            Name = 'GroupUndo'
            DataType = 'Boolean'
            ReadAccess = 'GetGroupUndo'
            WriteAccess = 'SetGroupUndo'
          end
          item
            Name = 'KeepTrailingBlanks'
            DataType = 'Boolean'
            ReadAccess = 'GetKeepTrailingBlanks'
            WriteAccess = 'SetKeepTrailingBlanks'
          end
          item
            Name = 'LeftGutterWidth'
            DataType = 'Integer'
            ReadAccess = 'GetLeftGutterWidth'
            WriteAccess = 'SetLeftGutterWidth'
          end
          item
            Name = 'RightMargin'
            DataType = 'Integer'
            ReadAccess = 'GetRightMargin'
            WriteAccess = 'SetRightMargin'
          end
          item
            Name = 'OverwriteBlocks'
            DataType = 'Boolean'
            ReadAccess = 'GetOverwriteBlocks'
            WriteAccess = 'SetOverwriteBlocks'
          end
          item
            Name = 'PersistentBlocks'
            DataType = 'Boolean'
            ReadAccess = 'GetPersistentBlocks'
            WriteAccess = 'SetPersistentBlocks'
          end
          item
            Name = 'PreserveLineEnds'
            DataType = 'Boolean'
            ReadAccess = 'GetPreserveLineEnds'
            WriteAccess = 'SetPreserveLineEnds'
          end
          item
            Name = 'SmartTab'
            DataType = 'Boolean'
            ReadAccess = 'GetSmartTab'
            WriteAccess = 'SetSmartTab'
          end
          item
            Name = 'SyntaxHighlight'
            DataType = 'Boolean'
            ReadAccess = 'GetSyntaxHighlight'
            WriteAccess = 'SetSyntaxHighlight'
          end
          item
            Name = 'TabStops'
            DataType = 'string'
            ReadAccess = 'GetTabStops'
            WriteAccess = 'SetTabStops'
          end
          item
            Name = 'UndoAfterSave'
            DataType = 'Boolean'
            ReadAccess = 'GetUndoAfterSave'
            WriteAccess = 'SetUndoAfterSave'
          end
          item
            Name = 'UndoLimit'
            DataType = 'Integer'
            ReadAccess = 'GetUndoLimit'
            WriteAccess = 'SetUndoLimit'
          end
          item
            Name = 'UseTabCharacter'
            DataType = 'Boolean'
            ReadAccess = 'GetuseTabCharacter'
            WriteAccess = 'SetUseTabCharacter'
          end>
      end
      item
        Name = 'IOTABufferOptions70'
        Ancestor = 'IOTABufferOptions60'
        Methods = <
          item
            Name = 'GetShowSpace'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetShowTab'
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'SetShowSpace'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetShowTab'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'ShowSpace'
            DataType = 'Boolean'
            ReadAccess = 'GetShowSpace'
            WriteAccess = 'SetShowSpace'
          end
          item
            Name = 'ShowTab'
            DataType = 'Boolean'
            ReadAccess = 'GetShowTab'
            WriteAccess = 'SetShowTab'
          end>
      end
      item
        Name = 'IOTABufferOptions'
        Ancestor = 'IOTABufferOptions70'
        Methods = <
          item
            Name = 'GetHighlightCurrentLine'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'GetShowLineBreaks'
            ResultType = 'Boolean'
            Visibility = cvPrivate
            Kind = mkFunction
          end
          item
            Name = 'SetHighlightCurrentLine'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetShowLineBreaks'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'HighlightCurrentLine'
            DataType = 'Boolean'
            ReadAccess = 'GetHighlightCurrentLine'
            WriteAccess = 'SetHighlightCurrentLine'
          end
          item
            Name = 'ShowLineBreaks'
            DataType = 'Boolean'
            ReadAccess = 'GetShowLineBreaks'
            WriteAccess = 'SetShowLineBreaks'
          end>
      end>
    Constants = <
      item
        Name = 'utForm'
        DataType = 'Integer'
        Value = 0
      end
      item
        Name = 'utDataModule'
        DataType = 'Integer'
        Value = 1
      end
      item
        Name = 'utProjUnit'
        DataType = 'Integer'
        Value = 2
      end
      item
        Name = 'utUnit'
        DataType = 'Integer'
        Value = 3
      end
      item
        Name = 'utRc'
        DataType = 'Integer'
        Value = 4
      end
      item
        Name = 'utAsm'
        DataType = 'Integer'
        Value = 5
      end
      item
        Name = 'utDef'
        DataType = 'Integer'
        Value = 6
      end
      item
        Name = 'utObj'
        DataType = 'Integer'
        Value = 7
      end
      item
        Name = 'utRes'
        DataType = 'Integer'
        Value = 8
      end
      item
        Name = 'utLib'
        DataType = 'Integer'
        Value = 9
      end
      item
        Name = 'utTypeLib'
        DataType = 'Integer'
        Value = 10
      end
      item
        Name = 'utPackageImport'
        DataType = 'Integer'
        Value = 11
      end
      item
        Name = 'utFormResource'
        DataType = 'Integer'
        Value = 12
      end
      item
        Name = 'utNoMake'
        DataType = 'Integer'
        Value = 13
      end
      item
        Name = 'atWhiteSpace'
        DataType = 'Integer'
        Value = 0
      end
      item
        Name = 'atComment'
        DataType = 'Integer'
        Value = 1
      end
      item
        Name = 'atReservedWord'
        DataType = 'Integer'
        Value = 2
      end
      item
        Name = 'atIdentifier'
        DataType = 'Integer'
        Value = 3
      end
      item
        Name = 'atSymbol'
        DataType = 'Integer'
        Value = 4
      end
      item
        Name = 'atString'
        DataType = 'Integer'
        Value = 5
      end
      item
        Name = 'atNumber'
        DataType = 'Integer'
        Value = 6
      end
      item
        Name = 'atFloat'
        DataType = 'Integer'
        Value = 7
      end
      item
        Name = 'atOctal'
        DataType = 'Integer'
        Value = 8
      end
      item
        Name = 'atHex'
        DataType = 'Integer'
        Value = 9
      end
      item
        Name = 'atCharacter'
        DataType = 'Integer'
        Value = 10
      end
      item
        Name = 'atPreproc'
        DataType = 'Integer'
        Value = 11
      end
      item
        Name = 'atIllegal'
        DataType = 'Integer'
        Value = 12
      end
      item
        Name = 'atAssembler'
        DataType = 'Integer'
        Value = 13
      end
      item
        Name = 'SyntaxOff'
        DataType = 'Integer'
        Value = 14
      end
      item
        Name = 'MarkedBlock'
        DataType = 'Integer'
        Value = 15
      end
      item
        Name = 'SearchMatch'
        DataType = 'Integer'
        Value = 16
      end
      item
        Name = 'atHotLink'
        DataType = 'Integer'
        Value = 17
      end
      item
        Name = 'atTags'
        DataType = 'Integer'
        Value = 20
      end
      item
        Name = 'atAttrNames'
        DataType = 'Integer'
        Value = 21
      end
      item
        Name = 'atAttrValues'
        DataType = 'Integer'
        Value = 22
      end
      item
        Name = 'atScripts'
        DataType = 'Integer'
        Value = 23
      end
      item
        Name = 'RightMargin'
        DataType = 'Integer'
        Value = 37
      end
      item
        Name = 'lfCurrentEIP'
        DataType = 'Integer'
        Value = 1
      end
      item
        Name = 'lfBreakpointEnabled'
        DataType = 'Integer'
        Value = 2
      end
      item
        Name = 'lfBreakpointDisabled'
        DataType = 'Integer'
        Value = 4
      end
      item
        Name = 'lfBreakpointInvalid'
        DataType = 'Integer'
        Value = 8
      end
      item
        Name = 'lfErrorLine'
        DataType = 'Integer'
        Value = 16
      end
      item
        Name = 'lfBreakpointVerified'
        DataType = 'Integer'
        Value = 32
      end
      item
        Name = 'lfBackgroundBkpt'
        DataType = 'Integer'
        Value = 64
      end
      item
        Name = 'lfBackgroupEIP'
        DataType = 'Integer'
        Value = 128
      end
      item
        Name = 'rkRegion'
        DataType = 'Integer'
        Value = 0
      end
      item
        Name = 'rkIf'
        DataType = 'Integer'
        Value = 1
      end
      item
        Name = 'rkNameSpace'
        DataType = 'Integer'
        Value = 2
      end
      item
        Name = 'rkType'
        DataType = 'Integer'
        Value = 3
      end
      item
        Name = 'rkMethod'
        DataType = 'Integer'
        Value = 4
      end
      item
        Name = 'rkNestedMethod'
        DataType = 'Integer'
        Value = 5
      end
      item
        Name = 'rkGlobal'
        DataType = 'Integer'
        Value = 6
      end
      item
        Name = 'rkDocumentation'
        DataType = 'Integer'
        Value = 7
      end
      item
        Name = 'mcGetFindString'
        DataType = 'String'
        Value = 'GetFindString'
      end
      item
        Name = 'mcReplace'
        DataType = 'String'
        Value = 'Replace'
      end
      item
        Name = 'mcRepeatSearch'
        DataType = 'String'
        Value = 'RepeatSearch'
      end
      item
        Name = 'mcIncrementalSearch'
        DataType = 'String'
        Value = 'IncrementalSearch'
      end
      item
        Name = 'mcGotoLine'
        DataType = 'String'
        Value = 'GotoLine'
      end
      item
        Name = 'mcClipCut'
        DataType = 'String'
        Value = 'ClipCut'
      end
      item
        Name = 'mcClipCopy'
        DataType = 'String'
        Value = 'ClipCopy'
      end
      item
        Name = 'mcClipPaste'
        DataType = 'String'
        Value = 'ClipPaste'
      end
      item
        Name = 'mcClipClear'
        DataType = 'String'
        Value = 'ClipClear'
      end
      item
        Name = 'mcHelpKeywordSearch'
        DataType = 'String'
        Value = 'HelpKeywordSearch'
      end
      item
        Name = 'mcOpenFileAtCursor'
        DataType = 'String'
        Value = 'OpenFileAtCursor'
      end
      item
        Name = 'mcToggleBreakpoint'
        DataType = 'String'
        Value = 'ToggleBreakpoint'
      end
      item
        Name = 'mcRunToHere'
        DataType = 'String'
        Value = 'RunToHere'
      end
      item
        Name = 'mcUndo'
        DataType = 'String'
        Value = 'Undo'
      end
      item
        Name = 'mcRedo'
        DataType = 'String'
        Value = 'Redo'
      end
      item
        Name = 'mcModify'
        DataType = 'String'
        Value = 'Modify'
      end
      item
        Name = 'mcAddWatchAtCursor'
        DataType = 'String'
        Value = 'AddWatchAtCursor'
      end
      item
        Name = 'mcInspectAtCursor'
        DataType = 'String'
        Value = 'InspectAtCursor'
      end
      item
        Name = 'mcSetMark0'
        DataType = 'String'
        Value = 'setMark0'
      end
      item
        Name = 'mcSetMark1'
        DataType = 'String'
        Value = 'setMark1'
      end
      item
        Name = 'mcSetMark2'
        DataType = 'String'
        Value = 'setMark2'
      end
      item
        Name = 'mcSetMark3'
        DataType = 'String'
        Value = 'setMark3'
      end
      item
        Name = 'mcSetMark4'
        DataType = 'String'
        Value = 'setMark4'
      end
      item
        Name = 'mcSetMark5'
        DataType = 'String'
        Value = 'setMark5'
      end
      item
        Name = 'mcSetMark6'
        DataType = 'String'
        Value = 'setMark6'
      end
      item
        Name = 'mcSetMark7'
        DataType = 'String'
        Value = 'setMark7'
      end
      item
        Name = 'mcSetMark8'
        DataType = 'String'
        Value = 'setMark8'
      end
      item
        Name = 'mcSetMark9'
        DataType = 'String'
        Value = 'setMark9'
      end
      item
        Name = 'mcMoveToMark0'
        DataType = 'String'
        Value = 'moveToMark0'
      end
      item
        Name = 'mcMoveToMark1'
        DataType = 'String'
        Value = 'moveToMark1'
      end
      item
        Name = 'mcMoveToMark2'
        DataType = 'String'
        Value = 'moveToMark2'
      end
      item
        Name = 'mcMoveToMark3'
        DataType = 'String'
        Value = 'moveToMark3'
      end
      item
        Name = 'mcMoveToMark4'
        DataType = 'String'
        Value = 'moveToMark4'
      end
      item
        Name = 'mcMoveToMark5'
        DataType = 'String'
        Value = 'moveToMark5'
      end
      item
        Name = 'mcMoveToMark6'
        DataType = 'String'
        Value = 'moveToMark6'
      end
      item
        Name = 'mcMoveToMark7'
        DataType = 'String'
        Value = 'moveToMark7'
      end
      item
        Name = 'mcMoveToMark8'
        DataType = 'String'
        Value = 'moveToMark8'
      end
      item
        Name = 'mcMoveToMark9'
        DataType = 'String'
        Value = 'moveToMark9'
      end
      item
        Name = 'sEditor'
        DataType = 'String'
        Value = 'editor'
      end
      item
        Name = 'dVCL'
        DataType = 'String'
        Value = 'dfm'
      end
      item
        Name = 'dCLX'
        DataType = 'String'
        Value = 'xfm'
      end
      item
        Name = 'dFMX'
        DataType = 'String'
        Value = 'fmx'
      end
      item
        Name = 'dFMI'
        DataType = 'String'
        Value = 'fmi'
      end
      item
        Name = 'dVCLNet'
        DataType = 'String'
        Value = 'nfm'
      end
      item
        Name = 'dDotNet'
        DataType = 'String'
        Value = '.NET'
      end
      item
        Name = 'dHTML'
        DataType = 'String'
        Value = 'HTML'
      end
      item
        Name = 'dAny'
        DataType = 'String'
        Value = 'Any'
      end
      item
        Name = 'WizardEntryPoint'
        DataType = 'String'
        Value = 'INITWIZARD0001'
      end
      item
        Name = 'isWizards'
        DataType = 'String'
        Value = 'Wizards'
      end
      item
        Name = 'sCustomToolBar'
        DataType = 'String'
        Value = 'CustomToolBar'
      end
      item
        Name = 'sStandardToolBar'
        DataType = 'String'
        Value = 'StandardToolBar'
      end
      item
        Name = 'sDebugToolBar'
        DataType = 'String'
        Value = 'DebugToolBar'
      end
      item
        Name = 'sViewToolBar'
        DataType = 'String'
        Value = 'ViewToolBar'
      end
      item
        Name = 'sDesktopToolBar'
        DataType = 'String'
        Value = 'DesktopToolBar'
      end
      item
        Name = 'sInternetToolBar'
        DataType = 'String'
        Value = 'InternetToolBar'
      end
      item
        Name = 'sCORBAToolBar'
        DataType = 'String'
        Value = 'CORBAToolBar'
      end
      item
        Name = 'sAlignToolbar'
        DataType = 'String'
        Value = 'AlignToolbar'
      end
      item
        Name = 'sBrowserToolbar'
        DataType = 'String'
        Value = 'BrowserToolbar'
      end
      item
        Name = 'sHTMLDesignToolbar'
        DataType = 'String'
        Value = 'HTMLDesignToolbar'
      end
      item
        Name = 'sHTMLFormatToolbar'
        DataType = 'String'
        Value = 'HTMLFormatToolbar'
      end
      item
        Name = 'sHTMLTableToolbar'
        DataType = 'String'
        Value = 'HTMLTableToolbar'
      end
      item
        Name = 'sPersonalityToolBar'
        DataType = 'String'
        Value = 'PersonalityToolBar'
      end
      item
        Name = 'sPositionToolbar'
        DataType = 'String'
        Value = 'PositionToolbar'
      end
      item
        Name = 'sSpacingToolbar'
        DataType = 'String'
        Value = 'SpacingToolbar'
      end
      item
        Name = 'sIDEInsightToolbar'
        DataType = 'String'
        Value = 'IDEInsightToolBar'
      end
      item
        Name = 'sPlatformDeviceToolbar'
        DataType = 'String'
        Value = 'PlatformDeviceToolBar'
      end
      item
        Name = 'sApplication'
        DataType = 'String'
        Value = 'Application'
      end
      item
        Name = 'sLibrary'
        DataType = 'String'
        Value = 'Library'
      end
      item
        Name = 'sConsole'
        DataType = 'String'
        Value = 'Console'
      end
      item
        Name = 'sPackage'
        DataType = 'String'
        Value = 'Package'
      end
      item
        Name = 'sStaticLibrary'
        DataType = 'String'
        Value = 'StaticLibrary'
      end
      item
        Name = 'sOptionSet'
        DataType = 'String'
        Value = 'OptionSet'
      end
      item
        Name = 'sFrameworkTypeNone'
        DataType = 'String'
        Value = 'None'
      end
      item
        Name = 'sFrameworkTypeVCL'
        DataType = 'String'
        Value = 'VCL'
      end
      item
        Name = 'sFrameworkTypeFMX'
        DataType = 'String'
        Value = 'FMX'
      end
      item
        Name = 'sFrameworkTypeFMI'
        DataType = 'String'
        Value = 'FMI'
      end
      item
        Name = 'sFrameworkTypeDotNet'
        DataType = 'String'
        Value = 'DotNet'
      end
      item
        Name = 'sUnit'
        DataType = 'String'
        Value = 'Unit'
      end
      item
        Name = 'sForm'
        DataType = 'String'
        Value = 'Form'
      end
      item
        Name = 'sText'
        DataType = 'String'
        Value = 'Text'
      end
      item
        Name = 'sbaPCHCompile'
        DataType = 'String'
        Value = 'PCHCompile'
      end
      item
        Name = 'sAssembly'
        DataType = 'String'
        Value = 'Assembly'
      end
      item
        Name = 'sUserControl'
        DataType = 'String'
        Value = 'UserControl'
      end
      item
        Name = 'sClass'
        DataType = 'String'
        Value = 'Class'
      end
      item
        Name = 'sWinForm'
        DataType = 'String'
        Value = 'WinForm'
      end
      item
        Name = 'sCppConsoleExe'
        DataType = 'String'
        Value = 'CppConsoleApplication'
      end
      item
        Name = 'sCppGuiApplication'
        DataType = 'String'
        Value = 'CppGuiApplication'
      end
      item
        Name = 'sCppVCLApplication'
        DataType = 'String'
        Value = 'CppVCLApplication'
      end
      item
        Name = 'sCppDynamicLibrary'
        DataType = 'String'
        Value = 'CppDynamicLibrary'
      end
      item
        Name = 'sCppPackage'
        DataType = 'String'
        Value = 'CppPackage'
      end
      item
        Name = 'sCppStaticLibrary'
        DataType = 'String'
        Value = 'CppStaticLibrary'
      end
      item
        Name = 'sCppManagedConsoleExe'
        DataType = 'String'
        Value = 'CppManagedConsoleApp'
      end
      item
        Name = 'sCppManagedDll'
        DataType = 'String'
        Value = 'CppManagedDynamicLibrary'
      end
      item
        Name = 'sClxGuiApp'
        DataType = 'String'
        Value = 'ClxGuiApplication'
      end
      item
        Name = 'sFmxGuiApp'
        DataType = 'String'
        Value = 'FmxGuiApplication'
      end
      item
        Name = 'sFmiGuiApp'
        DataType = 'String'
        Value = 'FmiGuiApplication'
      end
      item
        Name = 'mmSkipWord'
        DataType = 'Integer'
        Value = '0'
      end
      item
        Name = 'mmSkipNonWord'
        DataType = 'Integer'
        Value = '1'
      end
      item
        Name = 'mmSkipWhite'
        DataType = 'Integer'
        Value = '3'
      end
      item
        Name = 'mmSkipSpecial'
        DataType = 'Integer'
        Value = '4'
      end
      item
        Name = 'mmSkipNonSpecial'
        DataType = 'Integer'
        Value = '5'
      end
      item
        Name = 'mmSkipLeft'
        DataType = 'Integer'
        Value = '0'
      end
      item
        Name = 'mmSkipRight'
        DataType = 'Integer'
        Value = 16
      end
      item
        Name = 'mmSkipStream'
        DataType = 'Integer'
        Value = 32
      end
      item
        Name = 'csCodelist'
        DataType = 'Integer'
        Value = 1
      end
      item
        Name = 'csParamList'
        DataType = 'Integer'
        Value = 2
      end
      item
        Name = 'csManual'
        DataType = 'Integer'
        Value = 128
      end
      item
        Name = 'kfImplicitShift'
        DataType = 'Integer'
        Value = 1
      end
      item
        Name = 'kfImplicitModifier'
        DataType = 'Integer'
        Value = 2
      end
      item
        Name = 'kfImplicitKeypad'
        DataType = 'Integer'
        Value = 4
      end
      item
        Name = 'rfBackward'
        DataType = 'Integer'
        Value = 256
      end
      item
        Name = 'rfInvertLegalChars'
        DataType = 'Integer'
        Value = 4096
      end
      item
        Name = 'rfIncludeUpperAlphaChars'
        DataType = 'Integer'
        Value = 1
      end
      item
        Name = 'rfIncludeLowerAlphaChars'
        DataType = 'Integer'
        Value = 2
      end
      item
        Name = 'rfIncludeAlphaChars'
        DataType = 'Integer'
        Value = 3
      end
      item
        Name = 'rfIncludeNumericChars'
        DataType = 'Integer'
        Value = 4
      end
      item
        Name = 'rfIncludeSpecialChars'
        DataType = 'Integer'
        Value = 8
      end
      item
        Name = 'omtForm'
        DataType = 'Integer'
        Value = 0
      end
      item
        Name = 'omtDataModule'
        DataType = 'Integer'
        Value = 1
      end
      item
        Name = 'omtProjUnit'
        DataType = 'Integer'
        Value = 2
      end
      item
        Name = 'omtUnit'
        DataType = 'Integer'
        Value = 3
      end
      item
        Name = 'omtRc'
        DataType = 'Integer'
        Value = 4
      end
      item
        Name = 'omtAsm'
        DataType = 'Integer'
        Value = 5
      end
      item
        Name = 'omtDef'
        DataType = 'Integer'
        Value = 6
      end
      item
        Name = 'omtObj'
        DataType = 'Integer'
        Value = 7
      end
      item
        Name = 'omtRes'
        DataType = 'Integer'
        Value = 8
      end
      item
        Name = 'omtLib'
        DataType = 'Integer'
        Value = 9
      end
      item
        Name = 'omtTypeLib'
        DataType = 'Integer'
        Value = 10
      end
      item
        Name = 'omtPackageImport'
        DataType = 'Integer'
        Value = 11
      end
      item
        Name = 'omtFormResource'
        DataType = 'Integer'
        Value = 12
      end
      item
        Name = 'omtCustom'
        DataType = 'Integer'
        Value = 13
      end
      item
        Name = 'omtIDL'
        DataType = 'Integer'
        Value = 14
      end
      item
        Name = 'sNonePersonality'
        DataType = 'String'
        Value = 'None.Personality'
      end
      item
        Name = 'sDefaultPersonality'
        DataType = 'String'
        Value = 'Default.Personality'
      end
      item
        Name = 'sDelphiPersonality'
        DataType = 'String'
        Value = 'Delphi.Personality'
      end
      item
        Name = 'sDelphiDotNetPersonality'
        DataType = 'String'
        Value = 'DelphiDotNet.Personality'
      end
      item
        Name = 'sCBuilderPersonality'
        DataType = 'String'
        Value = 'CPlusPlusBuilder.Personality'
      end
      item
        Name = 'sCSharpPersonality'
        DataType = 'String'
        Value = 'CSharp.Personality'
      end
      item
        Name = 'sVBPersonality'
        DataType = 'String'
        Value = 'VB.Personality'
      end
      item
        Name = 'sDesignPersonality'
        DataType = 'String'
        Value = 'Design.Personality'
      end
      item
        Name = 'sGenericPersonality'
        DataType = 'String'
        Value = 'Generic.Personality'
      end
      item
        Name = 'sCategoryRoot'
        DataType = 'String'
        Value = 'Borland.Root'
      end
      item
        Name = 'sCategoryGalileoOther'
        DataType = 'String'
        Value = 'Borland.Galileo.Other'
      end
      item
        Name = 'sCategoryDelphiNew'
        DataType = 'String'
        Value = 'Borland.Delphi.New'
      end
      item
        Name = 'sCategoryDelphiNewFiles'
        DataType = 'String'
        Value = 'Borland.Delphi.NewFiles'
      end
      item
        Name = 'sCategoryDelphiDotNetNew'
        DataType = 'String'
        Value = 'Borland.Delphi.NET.New'
      end
      item
        Name = 'sCategoryDelphiDotNetNewFiles'
        DataType = 'String'
        Value = 'Borland.Delphi.NET.NewFiles'
      end
      item
        Name = 'sCategoryCBuilderNew'
        DataType = 'String'
        Value = 'Borland.CBuilder.New'
      end
      item
        Name = 'sCategoryCBuilderNewFiles'
        DataType = 'String'
        Value = 'Borland.CBuilder.NewFiles'
      end
      item
        Name = 'sCategoryCurrentProject'
        DataType = 'String'
        Value = 'Borland.CurrentProject'
      end
      item
        Name = 'sCategoryCSharpNew'
        DataType = 'String'
        Value = 'Borland.CSharp.New'
      end
      item
        Name = 'sCategoryCSharpNewFiles'
        DataType = 'String'
        Value = 'Borland.CSharp.NewFiles'
      end
      item
        Name = 'sCategoryMarkupNew'
        DataType = 'String'
        Value = 'Borland.Markup.New'
      end
      item
        Name = 'sCategoryMarkupNewFiles'
        DataType = 'String'
        Value = 'Borland.Markup.NewFiles'
      end
      item
        Name = 'sCategoryVBNew'
        DataType = 'String'
        Value = 'Borland.VB.New'
      end
      item
        Name = 'sCategoryVBNewFiles'
        DataType = 'String'
        Value = 'Borland.VB.NewFiles'
      end
      item
        Name = 'sCategoryNewUnitTest'
        DataType = 'String'
        Value = 'UnitTest.Test'
      end
      item
        Name = 'cDefEdOptions'
        DataType = 'String'
        Value = 'Borland.EditOptions.'
      end
      item
        Name = 'dcAlign'
        DataType = 'String'
        Value = 'Align'
      end
      item
        Name = 'dcSize'
        DataType = 'String'
        Value = 'Size'
      end
      item
        Name = 'dcScale'
        DataType = 'String'
        Value = 'Scale'
      end
      item
        Name = 'dcTabOrder'
        DataType = 'String'
        Value = 'TabOrder'
      end
      item
        Name = 'dcCreationOrder'
        DataType = 'String'
        Value = 'CreationOrder'
      end
      item
        Name = 'dcLockControls'
        DataType = 'String'
        Value = 'LockControls'
      end
      item
        Name = 'dcFlipChildrenAll'
        DataType = 'String'
        Value = 'FlipChildrenAll'
      end
      item
        Name = 'dcFlipChildrenSelected'
        DataType = 'String'
        Value = 'FilpChildrenSelected'
      end
      item
        Name = 'sBorlandEditorCodeExplorer'
        DataType = 'String'
        Value = 'BorlandEditorCodeExplorer'
      end
      item
        Name = 'sBaseContainer'
        DataType = 'String'
        Value = 'BaseContainer'
      end
      item
        Name = 'sFileContainer'
        DataType = 'String'
        Value = 'FileContainer'
      end
      item
        Name = 'sProjectContainer'
        DataType = 'String'
        Value = 'ProjectContainer'
      end
      item
        Name = 'sProjectGroupContainer'
        DataType = 'String'
        Value = 'ProjectGroupContainer'
      end
      item
        Name = 'sCategoryContainer'
        DataType = 'String'
        Value = 'CategoryContainer'
      end
      item
        Name = 'sDirectoryContainer'
        DataType = 'String'
        Value = 'DirectoryContainer'
      end
      item
        Name = 'sReferencesContainer'
        DataType = 'String'
        Value = 'References'
      end
      item
        Name = 'sContainsContainer'
        DataType = 'String'
        Value = 'Contains'
      end
      item
        Name = 'sRequiresContainer'
        DataType = 'String'
        Value = 'Requires'
      end
      item
        Name = 'sVirtualFoldContainer'
        DataType = 'String'
        Value = 'VirtualFold'
      end
      item
        Name = 'sBuildConfigContainer'
        DataType = 'String'
        Value = 'BuildConfig'
      end
      item
        Name = 'sOptionSetContainer'
        DataType = 'String'
        Value = 'OptionSet'
      end
      item
        Name = 'sTargetPlatformContainer'
        DataType = 'String'
        Value = 'TargetPlatformContainer'
      end
      item
        Name = 'vvfPrivate'
        DataType = 'Integer'
        Value = 0
      end
      item
        Name = 'vvfProtected'
        DataType = 'Integer'
        Value = 1
      end
      item
        Name = 'vvfPublic'
        DataType = 'Integer'
        Value = 2
      end
      item
        Name = 'vvfPublished'
        DataType = 'Integer'
        Value = 3
      end
      item
        Name = 'vvfVisMask'
        DataType = 'Integer'
        Value = 4
      end
      item
        Name = 'vvfDeprecated'
        DataType = 'Integer'
        Value = 8
      end
      item
        Name = 'sBaseConfigurationKey'
        DataType = 'Integer'
        Value = 'Base'
      end
      item
        Name = 'svpNormal'
        DataType = 'Integer'
        Value = 0
      end
      item
        Name = 'svpLow'
        DataType = 'Integer'
        Value = 255
      end
      item
        Name = 'pmmpBuildSection'
        DataType = 'Integer'
        Value = 1000000
      end
      item
        Name = 'pmmpOpenSection'
        DataType = 'Integer'
        Value = 2000000
      end
      item
        Name = 'pmmpAddSection'
        DataType = 'Integer'
        Value = 3000000
      end
      item
        Name = 'pmmpRemoveSection'
        DataType = 'Integer'
        Value = 4000000
      end
      item
        Name = 'pmmpSaveSection'
        DataType = 'Integer'
        Value = 5000000
      end
      item
        Name = 'pmmpRenameSection'
        DataType = 'Integer'
        Value = 6000000
      end
      item
        Name = 'pmmpVersionControlSection'
        DataType = 'Integer'
        Value = 7000000
      end
      item
        Name = 'pmmpUtilsSection'
        DataType = 'Integer'
        Value = 8000000
      end
      item
        Name = 'pmmpReorderSection'
        DataType = 'Integer'
        Value = 9000000
      end
      item
        Name = 'pmmpOptionsSection'
        DataType = 'Integer'
        Value = 10000000
      end
      item
        Name = 'pmmpBuildConfig'
        DataType = 'Integer'
        Value = 11000000
      end
      item
        Name = 'pmmpUserOffset'
        DataType = 'Integer'
        Value = 500000
      end>
    Enumerations = <
      item
        Name = 'TOTACompileMode'
        Elements = <
          item
            Name = 'cmOTAMake'
          end
          item
            Name = 'cmOTABuild'
          end
          item
            Name = 'cmOTACheck'
          end
          item
            Name = 'cmOTAMakeUnit'
          end>
      end
      item
        Name = 'TOTACompileResult'
        Elements = <
          item
            Name = 'crOTAFailed'
          end
          item
            Name = 'crOTASucceeded'
          end
          item
            Name = 'crOTABackground'
          end>
      end
      item
        Name = 'TBindingType'
        Elements = <
          item
            Name = 'btComplete'
          end
          item
            Name = 'btPartial'
          end>
      end
      item
        Name = 'TKeyBindingResult'
        Elements = <
          item
            Name = 'krUnhandled'
          end
          item
            Name = 'krHandled'
          end
          item
            Name = 'krNextProc'
          end>
      end
      item
        Name = 'TSearchDirection'
        Elements = <
          item
            Name = 'sdForward'
          end
          item
            Name = 'sdBackward'
          end>
      end
      item
        Name = 'TOTASyntaxHighlighter'
        Elements = <
          item
            Name = 'shNone'
            IsUserDef = True
          end
          item
            Name = 'shQuery'
            UserDefValue = 1
            IsUserDef = True
          end
          item
            Name = 'shPascal'
            UserDefValue = 2
            IsUserDef = True
          end
          item
            Name = 'shC'
            UserDefValue = 3
            IsUserDef = True
          end
          item
            Name = 'shSQL'
            UserDefValue = 4
            IsUserDef = True
          end
          item
            Name = 'shIDL'
            UserDefValue = 5
            IsUserDef = True
          end
          item
            Name = 'shMax'
            UserDefValue = 255
            IsUserDef = True
          end>
      end
      item
        Name = 'TOTABlockType'
        Elements = <
          item
            Name = 'btInclusive'
          end
          item
            Name = 'btLine'
          end
          item
            Name = 'btColumn'
          end
          item
            Name = 'btNonInclusive'
          end
          item
            Name = 'btUnknown'
          end>
      end
      item
        Name = 'TOTASyncMode'
        Elements = <
          item
            Name = 'smNone'
          end
          item
            Name = 'smNormal'
          end
          item
            Name = 'smTemplates'
          end>
      end
      item
        Name = 'TOTASyncEditPointEventType'
        Elements = <
          item
            Name = 'sepEnter'
          end
          item
            Name = 'sepLeave'
          end
          item
            Name = 'sepExit'
          end>
      end
      item
        Name = 'TOTAModificationType'
        Elements = <
          item
            Name = 'mtModSinceLoad'
          end
          item
            Name = 'mtModSinceSave'
          end
          item
            Name = 'mtAnyMod'
          end>
      end
      item
        Name = 'TOTANavigateType'
        Elements = <
          item
            Name = 'ntUp'
          end
          item
            Name = 'ntDown'
          end
          item
            Name = 'ntHome'
          end
          item
            Name = 'ntEnd'
          end>
      end
      item
        Name = 'TOTAResHeaderValue'
        Elements = <
          item
            Name = 'hvFlags'
          end
          item
            Name = 'hvLanguage'
          end
          item
            Name = 'hvDataVersion'
          end
          item
            Name = 'hvVersion'
          end
          item
            Name = 'hvCharacteristics'
          end>
      end
      item
        Name = 'TOTATransactionType'
        Elements = <
          item
            Name = 'ttAdd'
          end
          item
            Name = 'ttDelete'
          end
          item
            Name = 'ttRename'
          end>
      end
      item
        Name = 'TOTATriggerResult'
        Elements = <
          item
            Name = 'trStop'
          end
          item
            Name = 'trContinue'
          end
          item
            Name = 'trDefault'
          end>
      end
      item
        Name = 'TOTAAccessType'
        Elements = <
          item
            Name = 'atRead'
          end
          item
            Name = 'atWrite'
          end
          item
            Name = 'atExecute'
          end>
      end
      item
        Name = 'TOTARunMode'
        Elements = <
          item
            Name = 'ormRun'
          end
          item
            Name = 'ormRunToEntry'
          end
          item
            Name = 'ormRunToMain'
          end
          item
            Name = 'ormRunToCursor'
          end
          item
            Name = 'ormStmtStepInto'
          end
          item
            Name = 'ormStmtStepOver'
          end
          item
            Name = 'ormInstStepInto'
          end
          item
            Name = 'ormInstStepOver'
          end
          item
            Name = 'ormStmtStepToSource'
          end
          item
            Name = 'ormRunToTerminate'
          end
          item
            Name = 'ormRunUntilReturn'
          end
          item
            Name = 'ormUnused'
          end>
      end
      item
        Name = 'TOTANotifyReason'
        Elements = <
          item
            Name = 'nrOther'
          end
          item
            Name = 'nrRunning'
          end
          item
            Name = 'nrStopped'
          end
          item
            Name = 'nrException'
          end
          item
            Name = 'nrFault'
          end>
      end
      item
        Name = 'TOTAEvaluateResult'
        Elements = <
          item
            Name = 'erOK'
          end
          item
            Name = 'erError'
          end
          item
            Name = 'erDeferred'
          end
          item
            Name = 'erBusy'
          end>
      end
      item
        Name = 'TOTAThreadState'
        Elements = <
          item
            Name = 'tsStopped'
          end
          item
            Name = 'tsRunnable'
          end
          item
            Name = 'tsBlocked'
          end
          item
            Name = 'tsNone'
          end
          item
            Name = 'tsOther'
          end>
      end
      item
        Name = 'TOTACallStackState'
        Elements = <
          item
            Name = 'csAccessible'
          end
          item
            Name = 'csInaccessible'
          end
          item
            Name = 'csWait'
          end>
      end
      item
        Name = 'TOTAEvalSideEffects'
        Elements = <
          item
            Name = 'eseNone'
          end
          item
            Name = 'eseAll'
          end
          item
            Name = 'esePropertiesOnly'
          end>
      end
      item
        Name = 'TOTAEntryPointSortType'
        Elements = <
          item
            Name = 'epsByName'
          end
          item
            Name = 'epsByAddress'
          end>
      end
      item
        Name = 'TOTAEntryPointSortDirection'
        Elements = <
          item
            Name = 'epsAscending'
          end
          item
            Name = 'epsDescending'
          end>
      end
      item
        Name = 'TOTAProcessState'
        Elements = <
          item
            Name = 'psNothing'
          end
          item
            Name = 'psRunning'
          end
          item
            Name = 'psStopping'
          end
          item
            Name = 'psStopped'
          end
          item
            Name = 'psFault'
          end
          item
            Name = 'psResFault'
          end
          item
            Name = 'psTerminated'
          end
          item
            Name = 'psException'
          end
          item
            Name = 'psNoProcess'
          end>
      end
      item
        Name = 'TOTAProcessType'
        Elements = <
          item
            Name = 'optWin32'
          end
          item
            Name = 'optOSX32'
          end
          item
            Name = 'optWin64'
          end
          item
            Name = 'optiOS'
          end
          item
            Name = 'optAndroid'
          end>
      end
      item
        Name = 'TLogItemType'
        Elements = <
          item
            Name = 'litDefault'
          end
          item
            Name = 'litODS'
          end
          item
            Name = 'litWMSent'
          end
          item
            Name = 'litWMPosted'
          end
          item
            Name = 'litOleClientStart'
          end
          item
            Name = 'litOleServerStart'
          end
          item
            Name = 'litOleClientEnd'
          end
          item
            Name = 'litSourceBreakpoint'
          end
          item
            Name = 'litLogBreakEval'
          end
          item
            Name = 'litBreakpointMessage'
          end
          item
            Name = 'litProcStart'
          end
          item
            Name = 'litProcExit'
          end
          item
            Name = 'litThreadStart'
          end
          item
            Name = 'litThreadExit'
          end
          item
            Name = 'litModLoad'
          end
          item
            Name = 'litModUnload'
          end
          item
            Name = 'litExceptFirstTry'
          end>
      end
      item
        Name = 'TOTAVisualizerUnavailableReason'
        Elements = <
          item
            Name = 'ovurProcessRunning'
          end
          item
            Name = 'ovurOutOfScope'
          end>
      end
      item
        Name = 'TOTAFileNotification'
        Elements = <
          item
            Name = 'ofnFileOpening'
          end
          item
            Name = 'ofnFileOpened'
          end
          item
            Name = 'ofnFileClosing'
          end
          item
            Name = 'ofnDefaultDesktopLoad'
          end
          item
            Name = 'ofnDefaultDesktopSave'
          end
          item
            Name = 'ofnProjectDesktopLoad'
          end
          item
            Name = 'ofnProjectDesktopSave'
          end
          item
            Name = 'ofnPackageInstalled'
          end
          item
            Name = 'ofnPackageUninstalled'
          end
          item
            Name = 'ofnActiveProjectChanged'
          end>
      end
      item
        Name = 'TOTAPackageProducer'
        Elements = <
          item
            Name = 'ppOTAUnknown'
          end
          item
            Name = 'ppOTADelphi'
          end
          item
            Name = 'ppOTABCB'
          end>
      end
      item
        Name = 'TOTAPackageConsumer'
        Elements = <
          item
            Name = 'pcOTAUnknown'
          end
          item
            Name = 'pcOTADelphi'
          end
          item
            Name = 'pcOTABCB'
          end
          item
            Name = 'pcOTABoth'
          end>
      end
      item
        Name = 'TOTAMessageKind'
        Elements = <
          item
            Name = 'otamkHint'
          end
          item
            Name = 'otamkWarn'
          end
          item
            Name = 'otamkError'
          end
          item
            Name = 'otamkFatal'
          end
          item
            Name = 'otamkInfo'
          end>
      end
      item
        Name = 'TOTAInvokeType'
        Elements = <
          item
            Name = 'itAuto'
          end
          item
            Name = 'itManual'
          end
          item
            Name = 'itTimer'
          end>
      end
      item
        Name = 'TOTACodeInsightType'
        Elements = <
          item
            Name = 'citNone'
          end
          item
            Name = 'citCodeInsight'
          end
          item
            Name = 'citParameterCodeInsight'
          end
          item
            Name = 'citBrowseCodeInsight'
          end
          item
            Name = 'citHintCodeInsight'
          end>
      end
      item
        Name = 'TOTASortOrder'
        Elements = <
          item
            Name = 'soAlpha'
          end
          item
            Name = 'soScope'
          end>
      end
      item
        Name = 'TOTAViewerSymbolFlags'
        Elements = <
          item
            Name = 'vsfUnknown'
          end
          item
            Name = 'vsfConstant'
          end
          item
            Name = 'vsfType'
          end
          item
            Name = 'vsfVariable'
          end
          item
            Name = 'vsfProcedure'
          end
          item
            Name = 'vsfFunction'
          end
          item
            Name = 'vsfUnit'
          end
          item
            Name = 'vsfLabel'
          end
          item
            Name = 'vsfProperty'
          end
          item
            Name = 'vsfConstructor'
          end
          item
            Name = 'vsfDestructor'
          end
          item
            Name = 'vsfInterface'
          end
          item
            Name = 'vsfEvent'
          end
          item
            Name = 'vsfParameter'
          end
          item
            Name = 'vsfLocalVar'
          end
          item
            Name = 'vsfReservedWord'
          end>
      end
      item
        Name = 'TOTAProcDispatchFlags'
        Elements = <
          item
            Name = 'pdfNone'
          end
          item
            Name = 'pdfVirtual'
          end
          item
            Name = 'pdfDynamic'
          end>
      end
      item
        Name = 'TOTACodeCompletionContext'
        Elements = <
          item
            Name = 'ccNone'
          end
          item
            Name = 'ccError'
          end
          item
            Name = 'ccMember'
          end
          item
            Name = 'ccArgument'
          end
          item
            Name = 'ccDecl'
          end
          item
            Name = 'ccTypeDecl'
          end
          item
            Name = 'ccExpr'
          end
          item
            Name = 'ccStatement'
          end
          item
            Name = 'ccConstExpr'
          end
          item
            Name = 'ccProcDecl'
          end
          item
            Name = 'ccMemberDecl'
          end
          item
            Name = 'ccNamespace'
          end
          item
            Name = 'ccComment'
          end
          item
            Name = 'ccStringLiteral'
          end
          item
            Name = 'ccDocument'
          end
          item
            Name = 'ccElement'
          end
          item
            Name = 'ccAttribute'
          end
          item
            Name = 'ccAny'
          end>
      end
      item
        Name = 'TOTAAffect'
        Elements = <
          item
            Name = 'afNothing'
          end
          item
            Name = 'afTop'
          end
          item
            Name = 'afLeft'
          end
          item
            Name = 'afBottom'
          end
          item
            Name = 'afRight'
          end
          item
            Name = 'afHCenter'
          end
          item
            Name = 'afVCenter'
          end
          item
            Name = 'afHSpace'
          end
          item
            Name = 'afVSpace'
          end
          item
            Name = 'afHWinCenter'
          end
          item
            Name = 'afVWinCenter'
          end
          item
            Name = 'afHSpaceInc'
          end
          item
            Name = 'afHSpaceDec'
          end
          item
            Name = 'afHSpaceDel'
          end
          item
            Name = 'afVSpaceInc'
          end
          item
            Name = 'afVSpaceDec'
          end
          item
            Name = 'afVSpaceDel'
          end
          item
            Name = 'afAlignToGrid'
          end
          item
            Name = 'afSnapToGrid'
          end
          item
            Name = 'afSendToBack'
          end
          item
            Name = 'afBringToFront'
          end>
      end
      item
        Name = 'TOTASizeAffect'
        Elements = <
          item
            Name = 'asNothing'
          end
          item
            Name = 'asHGrow'
          end
          item
            Name = 'asHShrink'
          end
          item
            Name = 'asHAbsolute'
          end
          item
            Name = 'asVGrow'
          end
          item
            Name = 'asVShrink'
          end
          item
            Name = 'asVAbsolute'
          end
          item
            Name = 'asWidths'
          end
          item
            Name = 'asHeights'
          end
          item
            Name = 'asWidthHeight'
          end
          item
            Name = 'asSizeToGrid'
          end>
      end
      item
        Name = 'TOTAAlphaFormat'
        Elements = <
          item
            Name = 'otaafIgnored'
          end
          item
            Name = 'otaafDefined'
          end
          item
            Name = 'otaafPremultiplied'
          end>
      end
      item
        Name = 'TOTADiffFlag'
        Elements = <
          item
            Name = 'dfOTABuffer'
          end
          item
            Name = 'dfOTAFile'
          end
          item
            Name = 'dfOTARevision'
          end>
      end
      item
        Name = 'TOTADifferenceType'
        Elements = <
          item
            Name = 'dtOTAInternal'
          end
          item
            Name = 'dtOTAExternal'
          end
          item
            Name = 'dtOTADefault'
          end>
      end
      item
        Name = 'TOTABuildEventType'
        Elements = <
          item
            Name = 'betOTAPreCompile'
          end
          item
            Name = 'betOTAPostCompile'
          end
          item
            Name = 'betOTAPreLink'
          end>
      end
      item
        Name = 'TOTABuildEventMode'
        Elements = <
          item
            Name = 'beOTAAlways'
          end
          item
            Name = 'beOTATargetOutOfDate'
          end>
      end>
    Forwards = <
      item
        Name = 'IOTAEditView'
      end
      item
        Name = 'IOTAEditBuffer'
      end
      item
        Name = 'IOTAEditOptions'
      end
      item
        Name = 'IOTAEditorServices'
      end
      item
        Name = 'IOTAKeyboardServices'
      end
      item
        Name = 'IOTAKeyContext'
      end
      item
        Name = 'IOTAEditBlock'
      end>
    Functions = <
      item
        Name = 'SetCursorPosition'
        Parameters = <
          item
            Name = 'Line'
            DataType = 'Integer'
          end
          item
            Name = 'Column'
            DataType = 'Integer'
          end>
        OnEval = dwsUnitSimpleEditorFunctionsSetCursorPositionEval
      end
      item
        Name = 'LocateText'
        Parameters = <
          item
            Name = 'Text'
            DataType = 'string'
          end>
        ResultType = 'Boolean'
        OnEval = dwsUnitSimpleEditorFunctionsLocateTextEval
      end
      item
        Name = 'ReplaceAll'
        Parameters = <
          item
            Name = 'Pattern'
            DataType = 'string'
          end
          item
            Name = 'ReplaceText'
            DataType = 'string'
          end>
        ResultType = 'Boolean'
        OnEval = dwsUnitEditorFunctionsReplaceAllEval
      end
      item
        Name = 'CenterCursor'
        Parameters = <
          item
            Name = 'Line'
            DataType = 'Integer'
          end
          item
            Name = 'Column'
            DataType = 'Integer'
          end>
        OnEval = dwsUnitEditorFunctionsCenterCursorEval
      end
      item
        Name = 'PageDown'
        OnEval = dwsUnitEditorFunctionsPageDownEval
      end
      item
        Name = 'PageUp'
        OnEval = dwsUnitEditorFunctionsPageUpEval
      end
      item
        Name = 'GotoBookmark'
        Parameters = <
          item
            Name = 'BookmarkID'
            DataType = 'Integer'
          end>
        ResultType = 'Boolean'
        OnEval = dwsUnitEditorFunctionsGotoBookmarkEval
      end
      item
        Name = 'MoveCursor'
        Parameters = <
          item
            Name = 'MoveMask'
            DataType = 'TMoveCursorMasks'
          end>
        OnEval = dwsUnitEditorFunctionsMoveCursorEval
      end
      item
        Name = 'SelectCurrentWord'
        OnEval = dwsUnitEditorFunctionsSelectCurrentWordEval
      end
      item
        Name = 'MoveOneWordRight'
        OnEval = dwsUnitEditorFunctionsMoveOneWordRightEval
      end
      item
        Name = 'MoveOneWordLeft'
        OnEval = dwsUnitEditorFunctionsMoveOneWordLeftEval
      end
      item
        Name = 'InsertText'
        Parameters = <
          item
            Name = 'Text'
            DataType = 'string'
          end>
        OnEval = dwsUnitEditorFunctionsInsertTextEval
      end>
    Records = <
      item
        Name = 'TOTAEditPos'
        Members = <
          item
            Name = 'Col'
            DataType = 'Integer'
          end
          item
            Name = 'Line'
            DataType = 'Integer'
          end>
        Properties = <>
      end
      item
        Name = 'TOTACharPos'
        Members = <
          item
            Name = 'CharIndex'
            DataType = 'Integer'
          end
          item
            Name = 'Line'
            DataType = 'Integer'
          end>
        Properties = <>
      end
      item
        Name = 'TSize'
        Members = <
          item
            Name = 'X'
            DataType = 'Integer'
          end
          item
            Name = 'Y'
            DataType = 'Integer'
          end>
        Properties = <>
      end>
    Synonyms = <
      item
        Name = 'TDateTime'
        DataType = 'Float'
      end
      item
        Name = 'TMoveCursorMasks'
        DataType = 'Integer'
      end
      item
        Name = 'TOTAModuleType'
        DataType = 'Integer'
      end
      item
        Name = 'TOTAAddress'
        DataType = 'Integer'
      end
      item
        Name = 'TOTASyntaxCode'
        DataType = 'Integer'
      end
      item
        Name = 'TOTALineClass'
        DataType = 'Integer'
      end
      item
        Name = 'OTAEdChar'
        DataType = 'String'
      end
      item
        Name = 'TOTALineSize'
        DataType = 'Integer'
      end
      item
        Name = 'TClassNavigateStyle'
        DataType = 'Integer'
      end
      item
        Name = 'TCodeCompleteStyle'
        DataType = 'Integer'
      end
      item
        Name = 'TOTARegionKind'
        DataType = 'Integer'
      end
      item
        Name = 'TKeyBindingFlags'
        DataType = 'Integer'
      end
      item
        Name = 'TOTAViewerVisibilityFlags'
        DataType = 'Integer'
      end>
    UnitName = 'Editor'
    StaticSymbols = False
    Left = 168
    Top = 112
  end
  object dwsUnitHelp: TdwsUnit
    Script = DelphiWebScript
    Functions = <
      item
        Name = 'GetIOTAHelpServices'
        ResultType = 'Variant'
        OnEval = dwsUnitHelpFunctionsGetIOTAHelpServicesEval
      end>
    UnitName = 'HelpServices'
    StaticSymbols = False
    Left = 168
    Top = 160
  end
end
